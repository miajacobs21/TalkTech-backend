import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'talktech.backend',
  appName: 'talktech-backend',
  webDir: 'build',
  server: {
    androidScheme: 'https'
  }
};

export default config;
