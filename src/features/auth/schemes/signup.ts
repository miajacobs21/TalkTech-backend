import Joi, { ObjectSchema } from 'joi';

const signupSchema: ObjectSchema = Joi.object().keys({
  username: Joi.string().required().min(4).max(10).messages({
    'string.base': 'Username must be of type string',
    'string.min': 'Invalid username - min 4 characters',
    'string.max': 'Invalid username - max 10 characters',
    'string.empty': 'Username is a required field'
  }),
  password: Joi.string().required().min(4).max(10).messages({
    'string.base': 'Password must be of type string',
    'string.min': 'Invalid password - min 4 characters',
    'string.max': 'Invalid password - max 10 characters',
    'string.empty': 'Password is a required field'
  }),
  email: Joi.string().required().email().messages({
    'string.base': 'Email must be of type string',
    'string.email': 'Email must be valid',
    'string.empty': 'Email is a required field'
  }),
  avatarColor: Joi.string().required().messages({
    'any.required': 'Avatar color is required'
  }),
  avatarImage: Joi.string().required().messages({
    'any.required': 'Avatar image is required'
  })
});

export { signupSchema };