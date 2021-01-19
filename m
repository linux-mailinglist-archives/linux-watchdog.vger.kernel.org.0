Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095132FB30B
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Jan 2021 08:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729488AbhASHdF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 19 Jan 2021 02:33:05 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:48568 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730702AbhASH0h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 19 Jan 2021 02:26:37 -0500
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1l1lOc-0005Xi-SK
        for linux-watchdog@vger.kernel.org; Tue, 19 Jan 2021 07:25:46 +0000
Received: by mail-wr1-f69.google.com with SMTP id w5so9401561wrl.9
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Jan 2021 23:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m2l7jSYxBbnk+fd2JgyTvgdBTnIDIqwdAS6klff0z70=;
        b=ReFEjS4JVR6maYrHumoPcvXyiTXf8M/sQrrpqlUwzDOLIITwWWjEP4qXc4F30Ps8h/
         tHCxSe6yq8QSKtAi5ojnbmaJNJ2FyRZ05wF9/53P/G5/k6ZQ+OlyCrvakGIzIxH1koiX
         oUs/zajZAEuPkzQhtRS9hNbNO+JMQuBEzhgDveu956JP8gqxBrCb0cc3H6Ca7OzOFE0w
         ykhrn784swmgNEUO0kIW5wdjZmIyuazRPRGJtlVAGF/HD1sS4bOPc1KxXFTvQG1YiqCJ
         IScxeRhcqfNz4Ln9j8MyJD/qkXThbQPDWuyloQE0S5VldBfdOex0EeC88Z1WnHKosxE8
         zKfQ==
X-Gm-Message-State: AOAM532w4wzE4tZpwqfH21OumqxXy8bp+q8ZlGzMd56kRZv8wSnVSC/R
        zyTRhBgX2n0X62nh38YrkFHmhWiGMZR0LJd6+/BWBM1ozUDjwoUwA/s8iynCeOcp7V2RSRxLUJn
        7lvjoq29Di2pu6zgYmgoYX+EfEF8PVbApstbUJ0cI5Wo6ZAhsVLbMzmvKwbJ8
X-Received: by 2002:a5d:5146:: with SMTP id u6mr2928010wrt.46.1611041146326;
        Mon, 18 Jan 2021 23:25:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7P+tE+DQhPyZRJTr4ghv9Nf/QkBFSBIn+YIECnRJA25pa3usrkYH+jmU9xpshwDp6gUKsGL2cTMvz1qggM1E=
X-Received: by 2002:a5d:5146:: with SMTP id u6mr2927973wrt.46.1611041145911;
 Mon, 18 Jan 2021 23:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20210118123749.4769-1-campion.kang@advantech.com.tw> <20210118123749.4769-4-campion.kang@advantech.com.tw>
In-Reply-To: <20210118123749.4769-4-campion.kang@advantech.com.tw>
From:   AceLan Kao <chia-lin.kao@canonical.com>
Date:   Tue, 19 Jan 2021 15:25:34 +0800
Message-ID: <CAFv23QngmvuKZb0_pK7RBa=VX=2ypabg5p1+vSqrT36CNdJhgw@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] mfd: ahc1ec0: Add support for Advantech embedded controller
To:     Campion Kang <campion.kang@advantech.com.tw>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Campion Kang <campion.kang@advantech.com.tw> 於 2021年1月18日 週一 下午8:37寫道：
>
> AHC1EC0 is the embedded controller driver for Advantech industrial
> products. This provides sub-devices such as hwmon and watchdog, and also
> expose functions for sub-devices to read/write the value to embedded
> controller.
>
> Changed since V5:
>         - Kconfig: add "AHC1EC0" string to clearly define the EC name
>         - fix the code according to reviewer's suggestion
>         - remove unnecessary header files
>         - change the structure name to lower case, align with others
> naming
>
> Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
> ---
>  drivers/mfd/Kconfig         |  10 +
>  drivers/mfd/Makefile        |   2 +
>  drivers/mfd/ahc1ec0.c       | 808 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/ahc1ec0.h | 276 ++++++++++++
>  4 files changed, 1096 insertions(+)
>  create mode 100644 drivers/mfd/ahc1ec0.c
>  create mode 100644 include/linux/mfd/ahc1ec0.h
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index bdfce7b15621..7d5fb5c17d9a 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2154,5 +2154,15 @@ config MFD_INTEL_M10_BMC
>           additional drivers must be enabled in order to use the functionality
>           of the device.
>
> +config MFD_AHC1EC0
> +       tristate "Advantech AHC1EC0 Embedded Controller Module"
> +       depends on X86
> +       select MFD_CORE
> +       help
> +         This is the core function that for Advantech EC drivers. It
> +         includes the sub-devices such as hwmon, watchdog, etc. And also
> +         provides expose functions for sub-devices to read/write the value
> +         to embedded controller.
> +
>  endmenu
>  endif
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 14fdb188af02..a6af9d8825f4 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -268,3 +268,5 @@ obj-$(CONFIG_MFD_KHADAS_MCU)        += khadas-mcu.o
>  obj-$(CONFIG_SGI_MFD_IOC3)     += ioc3.o
>  obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)       += simple-mfd-i2c.o
>  obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
> +
> +obj-$(CONFIG_MFD_AHC1EC0)      += ahc1ec0.o
> diff --git a/drivers/mfd/ahc1ec0.c b/drivers/mfd/ahc1ec0.c
> new file mode 100644
> index 000000000000..015f4307a54e
> --- /dev/null
> +++ b/drivers/mfd/ahc1ec0.c
> @@ -0,0 +1,808 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Advantech embedded controller core driver AHC1EC0
> + *
> + * Copyright 2020 Advantech IIoT Group
> + *
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/dmi.h>
> +#include <linux/errno.h>
> +#include <linux/mfd/ahc1ec0.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +#define DRV_NAME      "ahc1ec0"
> +
> +enum {
> +       ADVEC_SUBDEV_BRIGHTNESS = 0,
> +       ADVEC_SUBDEV_EEPROM,
> +       ADVEC_SUBDEV_GPIO,
> +       ADVEC_SUBDEV_HWMON,
> +       ADVEC_SUBDEV_LED,
> +       ADVEC_SUBDEV_WDT,
> +       ADVEC_SUBDEV_MAX,
> +};
> +
> +/* Wait IBF (Input Buffer Full) clear */
> +static int ec_wait_write(void)
> +{
> +       int i;
> +
> +       for (i = 0; i < EC_MAX_TIMEOUT_COUNT; i++) {
> +               if ((inb(EC_COMMAND_PORT) & EC_COMMAND_BIT_IBF) == 0)
> +                       return 0;
> +
> +               udelay(EC_RETRY_UDELAY);
> +       }
> +
> +       return -ETIMEDOUT;
> +}
> +
> +/* Wait OBF (Output Buffer Full) data ready */
> +static int ec_wait_read(void)
> +{
> +       int i;
> +
> +       for (i = 0; i < EC_MAX_TIMEOUT_COUNT; i++) {
> +               if ((inb(EC_COMMAND_PORT) & EC_COMMAND_BIT_OBF) != 0)
> +                       return 0;
> +
> +               udelay(EC_RETRY_UDELAY);
> +       }
> +
> +       return -ETIMEDOUT;
> +}
> +
> +/* Read data from EC HW RAM, the process is the following:
> + * Step 0. Wait IBF clear to send command
> + * Step 1. Send read command to EC command port
> + * Step 2. Wait IBF clear that means command is got by EC
> + * Step 3. Send read address to EC data port
> + * Step 4. Wait OBF data ready
> + * Step 5. Get data from EC data port
> + */
> +int read_hw_ram(struct adv_ec_platform_data *adv_ec_data, unsigned char addr, unsigned char *data)
> +{
> +       int ret;
> +
> +       mutex_lock(&adv_ec_data->lock);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_HW_RAM_READ, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(addr, EC_STATUS_PORT);
> +
> +       ret = ec_wait_read();
> +       if (ret)
> +               goto error;
> +       *data = inb(EC_STATUS_PORT);
> +
> +       mutex_unlock(&adv_ec_data->lock);
> +
> +       return ret;
> +
> +error:
> +       mutex_unlock(&adv_ec_data->lock);
> +       dev_err(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n", __func__,
> +              __LINE__);
> +
> +       return ret;
> +}
> +
> +/* Write data to EC HW RAM
> + * Step 0. Wait IBF clear to send command
> + * Step 1. Send write command to EC command port
> + * Step 2. Wait IBF clear that means command is got by EC
> + * Step 3. Send write address to EC data port
> + * Step 4. Wait IBF clear that means command is got by EC
> + * Step 5. Send data to EC data port
> + */
> +int write_hw_ram(struct adv_ec_platform_data *adv_ec_data, unsigned char addr, unsigned char data)
> +{
> +       int ret;
> +
> +       mutex_lock(&adv_ec_data->lock);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_HW_RAM_WRITE, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(addr, EC_STATUS_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(data, EC_STATUS_PORT);
> +
> +       mutex_unlock(&adv_ec_data->lock);
> +
> +       return 0;
> +
> +error:
> +       mutex_unlock(&adv_ec_data->lock);
> +
> +       dev_err(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n", __func__,
> +              __LINE__);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(write_hw_ram);
> +
> +/* Get dynamic control table */
> +static int adv_get_dynamic_tab(struct adv_ec_platform_data *adv_ec_data)
> +{
> +       int i, ret;
> +       unsigned char pin_tmp, device_id;
> +
> +       mutex_lock(&adv_ec_data->lock);
> +
> +       for (i = 0; i < EC_MAX_TBL_NUM; i++) {
> +               adv_ec_data->dym_tbl[i].device_id = 0xff;
> +               adv_ec_data->dym_tbl[i].hw_pin_num = 0xff;
> +       }
> +
> +       for (i = 0; i < EC_MAX_TBL_NUM; i++) {
> +               ret = ec_wait_write();
> +               if (ret) {
> +                       dev_dbg(adv_ec_data->dev, "%s: ec_wait_write. line: %d\n", __func__,
> +                               __LINE__);
> +                       goto error;
> +               }
> +               outb(EC_TBL_WRITE_ITEM, EC_COMMAND_PORT);
> +
> +               ret = ec_wait_write();
> +               if (ret) {
> +                       dev_dbg(adv_ec_data->dev, "%s: ec_wait_write. line: %d\n", __func__,
> +                               __LINE__);
> +                       goto error;
> +               }
> +               outb(i, EC_STATUS_PORT);
> +
> +               ret = ec_wait_read();
> +               if (ret) {
> +                       dev_dbg(adv_ec_data->dev, "%s: ec_wait_read. line: %d\n", __func__,
> +                               __LINE__);
> +                       goto error;
> +               }
> +
> +               /*
> +                *  If item is defined, EC will return item number.
> +                *  If table item is not defined, EC will return 0xFF.
> +                */
> +               pin_tmp = inb(EC_STATUS_PORT);
> +               if (pin_tmp == 0xff) {
> +                       dev_dbg(adv_ec_data->dev, "%s: inb(EC_STATUS_PORT)=0x%02x != 0xff.\n",
> +                               __func__, pin_tmp);
> +                       goto pass;
> +               }
> +
> +               ret = ec_wait_write();
> +               if (ret) {
> +                       dev_dbg(adv_ec_data->dev, "%s: ec_wait_write. line: %d\n", __func__,
> +                               __LINE__);
> +                       goto error;
> +               }
> +               outb(EC_TBL_GET_PIN, EC_COMMAND_PORT);
> +
> +               ret = ec_wait_read();
> +               if (ret) {
> +                       dev_dbg(adv_ec_data->dev, "%s: ec_wait_read. line: %d\n", __func__,
> +                               __LINE__);
> +                       goto error;
> +               }
> +               pin_tmp = inb(EC_STATUS_PORT) & 0xff;
> +               if (pin_tmp == 0xff) {
> +                       dev_dbg(adv_ec_data->dev, "%s: pin_tmp(0x%02X). line: %d\n", __func__,
> +                               pin_tmp, __LINE__);
> +                       goto pass;
> +               }
> +
> +               ret = ec_wait_write();
> +               if (ret)
> +                       goto error;
> +               outb(EC_TBL_GET_DEVID, EC_COMMAND_PORT);
> +
> +               ret = ec_wait_read();
> +               if (ret) {
> +                       dev_dbg(adv_ec_data->dev, "%s: ec_wait_read. line: %d\n", __func__,
> +                               __LINE__);
> +                       goto error;
> +               }
> +               device_id = inb(EC_STATUS_PORT) & 0xff;
> +
> +               dev_dbg(adv_ec_data->dev, "%s: device_id=0x%02X. line: %d\n", __func__,
> +                       device_id, __LINE__);
> +
> +               adv_ec_data->dym_tbl[i].device_id = device_id;
> +               adv_ec_data->dym_tbl[i].hw_pin_num = pin_tmp;
> +       }
> +
> +pass:
> +       mutex_unlock(&adv_ec_data->lock);
> +       return 0;
> +
> +error:
> +       mutex_unlock(&adv_ec_data->lock);
> +       dev_err(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n",
> +               __func__, __LINE__);
> +       return ret;
> +}
> +
> +int read_ad_value(struct adv_ec_platform_data *adv_ec_data, unsigned char hwpin,
> +               unsigned char multi)
> +{
> +       int ret;
> +       u32 ret_val;
> +       unsigned int LSB, MSB;
> +
> +       mutex_lock(&adv_ec_data->lock);
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_AD_INDEX_WRITE, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(hwpin, EC_STATUS_PORT);
> +
> +       ret = ec_wait_read();
> +       if (ret)
> +               goto error;
> +
> +       if (inb(EC_STATUS_PORT) == 0xff) {
> +               mutex_unlock(&adv_ec_data->lock);
> +               return -1;
> +       }
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_AD_LSB_READ, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_read();
> +       if (ret)
> +               goto error;
> +       LSB = inb(EC_STATUS_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_AD_MSB_READ, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_read();
> +       if (ret)
> +               goto error;
> +       MSB = inb(EC_STATUS_PORT);
> +       ret_val = ((MSB << 8) | LSB) & 0x03FF;
> +       ret_val = ret_val * multi * 100;
> +
> +       mutex_unlock(&adv_ec_data->lock);
> +       return ret_val;
> +
> +error:
> +       mutex_unlock(&adv_ec_data->lock);
> +
> +       dev_warn(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n", __func__,
> +               __LINE__);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(read_ad_value);
> +
> +int read_acpi_value(struct adv_ec_platform_data *adv_ec_data, unsigned char addr,
> +               unsigned char *pvalue)
> +{
> +       int ret;
> +       unsigned char value;
> +
> +       mutex_lock(&adv_ec_data->lock);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_ACPI_RAM_READ, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(addr, EC_STATUS_PORT);
> +
> +       ret = ec_wait_read();
> +       if (ret)
> +               goto error;
> +       value = inb(EC_STATUS_PORT);
> +       *pvalue = value;
> +
> +       mutex_unlock(&adv_ec_data->lock);
> +
> +       return 0;
> +
> +error:
> +       mutex_unlock(&adv_ec_data->lock);
> +
> +       dev_warn(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n", __func__,
> +               __LINE__);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(read_acpi_value);
> +
> +int write_acpi_value(struct adv_ec_platform_data *adv_ec_data, unsigned char addr,
> +               unsigned char value)
> +{
> +       int ret;
> +
> +       mutex_lock(&adv_ec_data->lock);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_ACPI_DATA_WRITE, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(addr, EC_STATUS_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(value, EC_STATUS_PORT);
> +
> +       mutex_unlock(&adv_ec_data->lock);
> +       return 0;
> +
> +error:
> +       mutex_unlock(&adv_ec_data->lock);
> +
> +       dev_warn(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n", __func__,
> +               __LINE__);
> +
> +       return ret;
> +}
> +
> +int read_gpio_status(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> +               unsigned char *pvalue)
> +{
> +       int ret;
> +
> +       unsigned char gpio_status_value;
> +
> +       mutex_lock(&adv_ec_data->lock);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_GPIO_INDEX_WRITE, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(PinNumber, EC_STATUS_PORT);
> +
> +       ret = ec_wait_read();
> +       if (ret)
> +               goto error;
> +
> +       if (inb(EC_STATUS_PORT) == 0xff) {
> +               dev_err(adv_ec_data->dev, "%s: Read Pin Number error!!\n", __func__);
> +               mutex_unlock(&adv_ec_data->lock);
> +               return -1;
> +       }
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_GPIO_STATUS_READ, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_read();
> +       if (ret)
> +               goto error;
> +       gpio_status_value = inb(EC_STATUS_PORT);
> +
> +       *pvalue = gpio_status_value;
> +       mutex_unlock(&adv_ec_data->lock);
> +       return 0;
> +
> +error:
> +       mutex_unlock(&adv_ec_data->lock);
> +
> +       dev_warn(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n", __func__,
> +               __LINE__);
> +       return ret;
> +}
> +
> +int write_gpio_status(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> +               unsigned char value)
> +{
> +       int ret;
> +
> +       mutex_lock(&adv_ec_data->lock);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_GPIO_INDEX_WRITE, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(PinNumber, EC_STATUS_PORT);
> +
> +       ret = ec_wait_read();
> +       if (ret)
> +               goto error;
> +
> +       if (inb(EC_STATUS_PORT) == 0xff) {
> +               mutex_unlock(&adv_ec_data->lock);
> +               dev_err(adv_ec_data->dev, "%s: Read Pin Number error!!\n", __func__);
> +               return -1;
> +       }
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_GPIO_STATUS_WRITE, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(value, EC_STATUS_PORT);
> +
> +       mutex_unlock(&adv_ec_data->lock);
> +       return 0;
> +
> +error:
> +       mutex_unlock(&adv_ec_data->lock);
> +       dev_err(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d", __func__,
> +               __LINE__);
> +
> +       return ret;
> +}
> +
> +int read_gpio_dir(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> +               unsigned char *pvalue)
> +{
> +       int ret;
> +       unsigned char gpio_dir_value;
> +
> +       mutex_lock(&adv_ec_data->lock);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_GPIO_INDEX_WRITE, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(PinNumber, EC_STATUS_PORT);
> +
> +       ret = ec_wait_read();
> +       if (ret)
> +               goto error;
> +
> +       if (inb(EC_STATUS_PORT) == 0xff) {
> +               mutex_unlock(&adv_ec_data->lock);
> +               dev_err(adv_ec_data->dev, "%s: Read Pin Number error!! line: %d\n", __func__,
> +                       __LINE__);
> +               return -1;
> +       }
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_GPIO_DIR_READ, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_read();
> +       if (ret)
> +               goto error;
> +       gpio_dir_value = inb(EC_STATUS_PORT);
> +       *pvalue = gpio_dir_value;
> +
> +       mutex_unlock(&adv_ec_data->lock);
> +       return 0;
> +
> +error:
> +       mutex_unlock(&adv_ec_data->lock);
> +
> +       dev_warn(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n", __func__,
> +                       __LINE__);
> +
> +       return ret;
> +}
> +
> +int write_gpio_dir(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> +               unsigned char value)
> +{
> +       int ret;
> +
> +       mutex_lock(&adv_ec_data->lock);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_GPIO_INDEX_WRITE, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(PinNumber, EC_STATUS_PORT);
> +
> +       ret = ec_wait_read();
> +       if (ret)
> +               goto error;
> +
> +       if (inb(EC_STATUS_PORT) == 0xff) {
> +               mutex_unlock(&adv_ec_data->lock);
> +               dev_warn(adv_ec_data->dev, "%s: Read Pin Number error!! line: %d\n", __func__,
> +                       __LINE__);
> +
> +               return -1;
> +       }
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(EC_GPIO_DIR_WRITE, EC_COMMAND_PORT);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(value, EC_STATUS_PORT);
> +
> +       mutex_unlock(&adv_ec_data->lock);
> +       return 0;
> +
> +error:
> +       mutex_unlock(&adv_ec_data->lock);
> +
> +       dev_warn(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n", __func__,
> +                       __LINE__);
> +
> +       return ret;
> +}
> +
> +int write_hwram_command(struct adv_ec_platform_data *adv_ec_data, unsigned char data)
> +{
> +       int ret;
> +
> +       mutex_lock(&adv_ec_data->lock);
> +
> +       ret = ec_wait_write();
> +       if (ret)
> +               goto error;
> +       outb(data, EC_COMMAND_PORT);
> +
> +       mutex_unlock(&adv_ec_data->lock);
> +       return 0;
> +
> +error:
> +       mutex_unlock(&adv_ec_data->lock);
> +
> +       dev_warn(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n", __func__,
> +                       __LINE__);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(write_hwram_command);
> +
> +static int adv_ec_get_productname(struct adv_ec_platform_data *adv_ec_data, char *product)
> +{
> +       const char *vendor, *device;
> +       int length = 0;
> +
> +       /* Check it is Advantech board */
> +       vendor = dmi_get_system_info(DMI_SYS_VENDOR);
> +       if (memcmp(vendor, "Advantech", sizeof("Advantech")) != 0)
> +               return -ENODEV;
> +
> +       /* Get product model name */
> +       device = dmi_get_system_info(DMI_PRODUCT_NAME);
> +       if (device) {
> +               while ((device[length] != ' ')
> +                       && (length < AMI_ADVANTECH_BOARD_ID_LENGTH))
> +                       length++;
> +               memset(product, 0, AMI_ADVANTECH_BOARD_ID_LENGTH);
> +               memmove(product, device, length);
> +
> +               dev_info(adv_ec_data->dev, "BIOS Product Name = %s\n", product);
> +
> +               return 0;
> +       }
> +
> +       dev_warn(adv_ec_data->dev, "This device is not Advantech Board (%s)!\n", product);
> +
> +       return -ENODEV;
> +}
> +
> +static const struct mfd_cell adv_ec_sub_cells[] = {
> +       { .name = "adv-ec-brightness", },
> +       { .name = "adv-ec-eeprom", },
> +       { .name = "adv-ec-gpio", },
> +       { .name = "ahc1ec0-hwmon", },
> +       { .name = "adv-ec-led", },
> +       { .name = "ahc1ec0-wdt", },
> +};
> +
> +static int adv_ec_init_ec_data(struct adv_ec_platform_data *adv_ec_data)
> +{
> +       int ret;
> +
> +       adv_ec_data->sub_dev_mask = 0;
> +       adv_ec_data->sub_dev_nb = 0;
> +       adv_ec_data->dym_tbl = NULL;
> +       adv_ec_data->bios_product_name = NULL;
> +
> +       mutex_init(&adv_ec_data->lock);
> +
> +       /* Get product name */
> +       adv_ec_data->bios_product_name =
> +               devm_kzalloc(adv_ec_data->dev, AMI_ADVANTECH_BOARD_ID_LENGTH, GFP_KERNEL);
> +       if (!adv_ec_data->bios_product_name)
> +               return -ENOMEM;
> +
> +       memset(adv_ec_data->bios_product_name, 0, AMI_ADVANTECH_BOARD_ID_LENGTH);
> +       ret = adv_ec_get_productname(adv_ec_data, adv_ec_data->bios_product_name);
> +       if (ret)
> +               return ret;
> +
> +       /* Get pin table */
> +       adv_ec_data->dym_tbl = devm_kzalloc(adv_ec_data->dev,
> +                                       EC_MAX_TBL_NUM * sizeof(struct ec_dynamic_table),
> +                                       GFP_KERNEL);
> +       if (!adv_ec_data->dym_tbl)
> +               return -ENOMEM;
> +
> +       ret = adv_get_dynamic_tab(adv_ec_data);
> +
> +       return ret;
> +}
> +
> +static int adv_ec_parse_prop(struct adv_ec_platform_data *adv_ec_data)
> +{
> +       int i, ret;
> +       u32 nb, sub_dev[ADVEC_SUBDEV_MAX];
> +
> +       ret = device_property_read_u32(adv_ec_data->dev, "advantech,sub-dev-nb", &nb);
> +       if (ret < 0) {
> +               dev_err(adv_ec_data->dev, "get sub-dev-nb failed! (%d)\n", ret);
> +               return ret;
> +       }
> +       adv_ec_data->sub_dev_nb = nb;
> +
> +       ret = device_property_read_u32_array(adv_ec_data->dev, "advantech,sub-dev",
> +                                            sub_dev, nb);
> +       if (ret < 0) {
> +               dev_err(adv_ec_data->dev, "get sub-dev failed! (%d)\n", ret);
> +               return ret;
> +       }
> +
> +       for (i = 0; i < nb; i++) {
> +               switch (sub_dev[i]) {
> +               case ADVEC_SUBDEV_BRIGHTNESS:
> +               case ADVEC_SUBDEV_EEPROM:
> +               case ADVEC_SUBDEV_GPIO:
> +               case ADVEC_SUBDEV_HWMON:
> +               case ADVEC_SUBDEV_LED:
> +               case ADVEC_SUBDEV_WDT:
> +                       adv_ec_data->sub_dev_mask |= BIT(sub_dev[i]);
> +                       break;
> +               default:
> +                       dev_err(adv_ec_data->dev, "invalid prop value(%d)!\n",
> +                               sub_dev[i]);
> +               }
> +       }
> +       dev_info(adv_ec_data->dev, "sub-dev mask = 0x%x\n", adv_ec_data->sub_dev_mask);
> +
> +       return 0;
> +}
> +
> +static int adv_ec_probe(struct platform_device *pdev)
> +{
> +       int ret, i;
> +       struct device *dev = &pdev->dev;
> +       struct adv_ec_platform_data *adv_ec_data;
> +
> +       adv_ec_data = devm_kzalloc(dev, sizeof(struct adv_ec_platform_data), GFP_KERNEL);
> +       if (!adv_ec_data)
> +               return -ENOMEM;
> +
> +       dev_set_drvdata(dev, adv_ec_data);
> +       adv_ec_data->dev = dev;
> +
> +       ret = adv_ec_init_ec_data(adv_ec_data);
> +       if (ret)
> +               goto err_init_data;
> +
> +       ret = adv_ec_parse_prop(adv_ec_data);
> +       if (ret)
> +               goto err_prop;
> +
> +       /* check whether this EC has the following subdevices. */
> +       for (i = 0; i < ARRAY_SIZE(adv_ec_sub_cells); i++) {
> +               if (adv_ec_data->sub_dev_mask & BIT(i)) {
> +                       ret = mfd_add_hotplug_devices(dev, &adv_ec_sub_cells[i], 1);
> +                       dev_info(adv_ec_data->dev, "mfd_add_hotplug_devices[%d] %s\n", i,
> +                               adv_ec_sub_cells[i].name);
> +                       if (ret)
> +                               dev_err(dev, "failed to add %s subdevice: %d\n",
> +                                       adv_ec_sub_cells[i].name, ret);
> +               }
> +       }
> +
> +       dev_info(adv_ec_data->dev, "Advantech EC probe done");
> +
> +       return 0;
> +
> +err_prop:
> +       dev_err(dev, "failed to probe\n");
> +
> +err_init_data:
> +       mutex_destroy(&adv_ec_data->lock);
> +
> +       dev_err(dev, "failed to init data\n");
> +
> +       return ret;
> +}
> +
> +static int adv_ec_remove(struct platform_device *pdev)
> +{
> +       struct adv_ec_platform_data *adv_ec_data;
> +
> +       adv_ec_data = dev_get_drvdata(&pdev->dev);
> +
> +       mutex_destroy(&adv_ec_data->lock);
> +
> +       mfd_remove_devices(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id adv_ec_of_match[] __maybe_unused = {
> +       {
> +               .compatible = "advantech,ahc1ec0",
> +       },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, adv_ec_of_match);
> +
> +static const struct acpi_device_id adv_ec_acpi_match[] __maybe_unused = {
> +       {"AHC1EC0", 0},
> +       {},
> +};
> +MODULE_DEVICE_TABLE(acpi, adv_ec_acpi_match);
> +
> +static struct platform_driver adv_ec_driver = {
> +       .driver = {
> +               .name = DRV_NAME,
> +               .of_match_table = of_match_ptr(adv_ec_of_match),
> +               .acpi_match_table = ACPI_PTR(adv_ec_acpi_match),
> +       },
> +       .probe = adv_ec_probe,
> +       .remove = adv_ec_remove,
> +};
> +module_platform_driver(adv_ec_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRV_NAME);
> +MODULE_DESCRIPTION("Advantech Embedded Controller core driver.");
> +MODULE_AUTHOR("Campion Kang <campion.kang@advantech.com.tw>");
> +MODULE_AUTHOR("Jianfeng Dai <jianfeng.dai@advantech.com.cn>");
> +MODULE_VERSION("1.0");
> diff --git a/include/linux/mfd/ahc1ec0.h b/include/linux/mfd/ahc1ec0.h
> new file mode 100644
> index 000000000000..1b01e10c1fef
> --- /dev/null
> +++ b/include/linux/mfd/ahc1ec0.h
> @@ -0,0 +1,276 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __LINUX_MFD_AHC1EC0_H
> +#define __LINUX_MFD_AHC1EC0_H
> +
> +#include <linux/device.h>
> +
> +#define EC_COMMAND_PORT             0x29A /* EC I/O command port */
> +#define EC_STATUS_PORT              0x299 /* EC I/O data port */
> +
> +#define EC_RETRY_UDELAY              200 /* EC command retry delay in microseconds */
> +#define EC_MAX_TIMEOUT_COUNT        5000 /* EC command max retry count */
> +#define EC_COMMAND_BIT_OBF          0x01 /* Bit 0 is for OBF ready (Output buffer full) */
> +#define EC_COMMAND_BIT_IBF          0x02 /* Bit 1 is for IBF ready (Input buffer full) */
> +
> +/* Analog to digital converter command */
> +#define EC_AD_INDEX_WRITE   0x15 /* Write ADC port number into index */
> +#define EC_AD_LSB_READ      0x16 /* Read ADC LSB value from ADC port */
> +#define EC_AD_MSB_READ      0x1F /* Read ADC MSB value from ADC port */
> +
> +/* Voltage device ID */
> +#define EC_DID_SMBOEM0      0x28 /* SMBUS/I2C. Smbus channel 0 */
> +#define EC_DID_CMOSBAT      0x50 /* CMOS coin battery voltage */
> +#define EC_DID_CMOSBAT_X2   0x51 /* CMOS coin battery voltage*2 */
> +#define EC_DID_CMOSBAT_X10  0x52 /* CMOS coin battery voltage*10 */
> +#define EC_DID_5VS0         0x56 /* 5VS0 voltage */
> +#define EC_DID_5VS0_X2      0x57 /* 5VS0 voltage*2 */
> +#define EC_DID_5VS0_X10     0x58 /* 5VS0 voltage*10 */
> +#define EC_DID_5VS5         0x59 /* 5VS5 voltage */
> +#define EC_DID_5VS5_X2      0x5A /* 5VS5 voltage*2 */
> +#define EC_DID_5VS5_X10     0x5B /* 5VS5 voltage*10 */
> +#define EC_DID_12VS0        0x62 /* 12VS0 voltage */
> +#define EC_DID_12VS0_X2     0x63 /* 12VS0 voltage*2 */
> +#define EC_DID_12VS0_X10    0x64 /* 12VS0 voltage*10 */
> +#define EC_DID_VCOREA       0x65 /* CPU A core voltage */
> +#define EC_DID_VCOREA_X2    0x66 /* CPU A core voltage*2 */
> +#define EC_DID_VCOREA_X10   0x67 /* CPU A core voltage*10 */
> +#define EC_DID_VCOREB       0x68 /* CPU B core voltage */
> +#define EC_DID_VCOREB_X2    0x69 /* CPU B core voltage*2 */
> +#define EC_DID_VCOREB_X10   0x6A /* CPU B core voltage*10 */
> +#define EC_DID_DC           0x6B /* ADC. onboard voltage */
> +#define EC_DID_DC_X2        0x6C /* ADC. onboard voltage*2 */
> +#define EC_DID_DC_X10       0x6D /* ADC. onboard voltage*10 */
> +
> +/* Current device ID */
> +#define EC_DID_CURRENT              0x74
> +
> +/* ACPI commands */
> +#define EC_ACPI_RAM_READ            0x80
> +#define EC_ACPI_RAM_WRITE           0x81
> +
> +/*
> + *  Dynamic control table commands
> + *  The table includes HW pin number, Device ID, and Pin polarity
> + */
> +#define EC_TBL_WRITE_ITEM           0x20
> +#define EC_TBL_GET_PIN              0x21
> +#define EC_TBL_GET_DEVID            0x22
> +#define EC_MAX_TBL_NUM              32
> +
> +/* LED Device ID table */
> +#define EC_DID_LED_RUN              0xE1
> +#define EC_DID_LED_ERR              0xE2
> +#define EC_DID_LED_SYS_RECOVERY     0xE3
> +#define EC_DID_LED_D105_G           0xE4
> +#define EC_DID_LED_D106_G           0xE5
> +#define EC_DID_LED_D107_G           0xE6
> +
> +/* LED control HW RAM address 0xA0-0xAF */
> +#define EC_HWRAM_LED_BASE_ADDR      0xA0
> +#define EC_HWRAM_LED_PIN(N)         (EC_HWRAM_LED_BASE_ADDR + (4 * (N))) // N:0-3
> +#define EC_HWRAM_LED_CTRL_HIBYTE(N) (EC_HWRAM_LED_BASE_ADDR + (4 * (N)) + 1)
> +#define EC_HWRAM_LED_CTRL_LOBYTE(N) (EC_HWRAM_LED_BASE_ADDR + (4 * (N)) + 2)
> +#define EC_HWRAM_LED_DEVICE_ID(N)   (EC_HWRAM_LED_BASE_ADDR + (4 * (N)) + 3)
> +
> +/* LED control bit */
> +#define LED_CTRL_ENABLE_BIT()           BIT(4)
> +#define LED_CTRL_INTCTL_BIT()           BIT(5)
> +#define LED_CTRL_LEDBIT_MASK            (0x03FF << 6)
> +#define LED_CTRL_POLARITY_MASK          (0x000F << 0)
> +#define LED_CTRL_INTCTL_EXTERNAL        0
> +#define LED_CTRL_INTCTL_INTERNAL        1
> +
> +#define LED_DISABLE  0x0
> +#define LED_ON       0x1
> +#define LED_FAST     0x3
> +#define LED_NORMAL   0x5
> +#define LED_SLOW     0x7
> +#define LED_MANUAL   0xF
> +
> +#define LED_CTRL_LEDBIT_DISABLE        0x0000
> +#define LED_CTRL_LEDBIT_ON             0x03FF
> +#define LED_CTRL_LEDBIT_FAST   0x02AA
> +#define LED_CTRL_LEDBIT_NORMAL 0x0333
> +#define LED_CTRL_LEDBIT_SLOW   0x03E0
> +
> +/* Get the device name */
> +#define AMI_ADVANTECH_BOARD_ID_LENGTH  32
> +
> +/*
> + * Advantech Embedded Controller watchdog commands
> + * EC can send multi-stage watchdog event. System can setup watchdog event
> + * independently to make up event sequence.
> + */
> +#define EC_COMMANS_PORT_IBF_MASK       0x02
> +#define EC_RESET_EVENT                         0x04
> +#define        EC_WDT_START                            0x28
> +#define        EC_WDT_STOP                                     0x29
> +#define        EC_WDT_RESET                            0x2A
> +#define        EC_WDT_BOOTTMEWDT_STOP          0x2B
> +
> +#define EC_HW_RAM                                      0x89
> +
> +#define EC_EVENT_FLAG                          0x57
> +#define EC_ENABLE_DELAY_H                      0x58
> +#define EC_ENABLE_DELAY_L                      0x59
> +#define EC_POWER_BTN_TIME_H                    0x5A
> +#define EC_POWER_BTN_TIME_L                    0x5B
> +#define EC_RESET_DELAY_TIME_H          0x5E
> +#define EC_RESET_DELAY_TIME_L          0x5F
> +#define EC_PIN_DELAY_TIME_H                    0x60
> +#define EC_PIN_DELAY_TIME_L                    0x61
> +#define EC_SCI_DELAY_TIME_H                    0x62
> +#define EC_SCI_DELAY_TIME_L                    0x63
> +
> +/* EC ACPI commands */
> +#define EC_ACPI_DATA_READ                      0x80
> +#define EC_ACPI_DATA_WRITE                     0x81
> +
> +/* Brightness ACPI Addr */
> +#define BRIGHTNESS_ACPI_ADDR           0x50
> +
> +/* EC HW RAM commands */
> +#define EC_HW_EXTEND_RAM_READ          0x86
> +#define EC_HW_EXTEND_RAM_WRITE         0x87
> +#define        EC_HW_RAM_READ                          0x88
> +#define EC_HW_RAM_WRITE                                0x89
> +
> +/* EC Smbus commands */
> +#define EC_SMBUS_CHANNEL_SET           0x8A     /* Set selector number (SMBUS channel) */
> +#define EC_SMBUS_ENABLE_I2C                    0x8C     /* Enable channel I2C */
> +#define EC_SMBUS_DISABLE_I2C           0x8D     /* Disable channel I2C */
> +
> +/* Smbus transmit protocol */
> +#define EC_SMBUS_PROTOCOL                      0x00
> +
> +/* SMBUS status */
> +#define EC_SMBUS_STATUS                                0x01
> +
> +/* SMBUS device slave address (bit0 must be 0) */
> +#define EC_SMBUS_SLV_ADDR                      0x02
> +
> +/* SMBUS device command */
> +#define EC_SMBUS_CMD                           0x03
> +
> +/* 0x04-0x24 Data In read process, return data are stored in this address */
> +#define EC_SMBUS_DATA                          0x04
> +
> +#define EC_SMBUS_DAT_OFFSET(n) (EC_SMBUS_DATA + (n))
> +
> +/* SMBUS channel selector (0-4) */
> +#define EC_SMBUS_CHANNEL                       0x2B
> +
> +/* EC SMBUS transmit Protocol code */
> +#define SMBUS_QUICK_WRITE                      0x02 /* Write Quick Command */
> +#define SMBUS_QUICK_READ                       0x03 /* Read Quick Command */
> +#define SMBUS_BYTE_SEND                                0x04 /* Send Byte */
> +#define SMBUS_BYTE_RECEIVE                     0x05 /* Receive Byte */
> +#define SMBUS_BYTE_WRITE                       0x06 /* Write Byte */
> +#define SMBUS_BYTE_READ                                0x07 /* Read Byte */
> +#define SMBUS_WORD_WRITE                       0x08 /* Write Word */
> +#define SMBUS_WORD_READ                                0x09 /* Read Word */
> +#define SMBUS_BLOCK_WRITE                      0x0A /* Write Block */
> +#define SMBUS_BLOCK_READ                       0x0B /* Read Block */
> +#define SMBUS_PROC_CALL                                0x0C /* Process Call */
> +#define SMBUS_BLOCK_PROC_CALL          0x0D /* Write Block-Read Block Process Call */
> +#define SMBUS_I2C_READ_WRITE           0x0E /* I2C block Read-Write */
> +#define SMBUS_I2C_WRITE_READ           0x0F /* I2C block Write-Read */
> +
> +/* GPIO control commands */
> +#define EC_GPIO_INDEX_WRITE                    0x10
> +#define EC_GPIO_STATUS_READ                    0x11
> +#define EC_GPIO_STATUS_WRITE           0x12
> +#define EC_GPIO_DIR_READ                       0x1D
> +#define EC_GPIO_DIR_WRITE                      0x1E
> +
> +/* One Key Recovery commands */
> +#define EC_ONE_KEY_FLAG                                0x9C
> +
> +/* ASG OEM commands */
> +#define EC_ASG_OEM                                     0xEA
> +#define EC_ASG_OEM_READ                                0x00
> +#define EC_ASG_OEM_WRITE                       0x01
> +#define EC_OEM_POWER_STATUS_VIN1       0X10
> +#define EC_OEM_POWER_STATUS_VIN2       0X11
> +#define EC_OEM_POWER_STATUS_BAT1       0X12
> +#define EC_OEM_POWER_STATUS_BAT2       0X13
> +
> +/* GPIO DEVICE ID */
> +#define EC_DID_ALTGPIO_0                       0x10    /* 0x10 AltGpio0 User define gpio */
> +#define EC_DID_ALTGPIO_1                       0x11    /* 0x11 AltGpio1 User define gpio */
> +#define EC_DID_ALTGPIO_2                       0x12    /* 0x12 AltGpio2 User define gpio */
> +#define EC_DID_ALTGPIO_3                       0x13    /* 0x13 AltGpio3 User define gpio */
> +#define EC_DID_ALTGPIO_4                       0x14    /* 0x14 AltGpio4 User define gpio */
> +#define EC_DID_ALTGPIO_5                       0x15    /* 0x15 AltGpio5 User define gpio */
> +#define EC_DID_ALTGPIO_6                       0x16    /* 0x16 AltGpio6 User define gpio */
> +#define EC_DID_ALTGPIO_7                       0x17    /* 0x17 AltGpio7 User define gpio */
> +
> +/* Lmsensor Chip Register */
> +#define NSLM96163_CHANNEL                      0x02
> +
> +/* NS_LM96163 address 0x98 */
> +#define NSLM96163_ADDR                         0x98
> +
> +/* LM96163 index(0x00) Local Temperature (Signed MSB) */
> +#define NSLM96163_LOC_TEMP                     0x00
> +
> +/* HWMON registers */
> +#define INA266_REG_VOLTAGE          0x02    /* 1.25mV */
> +#define INA266_REG_POWER            0x03    /* 25mW */
> +#define INA266_REG_CURRENT          0x04    /* 1mA */
> +
> +struct ec_hw_pin_table {
> +       unsigned int vbat[2];
> +       unsigned int v5[2];
> +       unsigned int v12[2];
> +       unsigned int vcore[2];
> +       unsigned int vdc[2];
> +       unsigned int ec_current[2];
> +       unsigned int power[2];
> +};
> +
> +struct ec_dynamic_table {
> +       unsigned char device_id;
> +       unsigned char hw_pin_num;
> +};
> +
> +struct ec_smbuso_em0 {
> +       unsigned char hw_pin_num;
> +};
> +
> +struct pled_hw_pin_tbl {
> +       unsigned int pled[6];
> +};
> +
> +struct adv_ec_platform_data {
> +       char *bios_product_name;
> +       int sub_dev_nb;
> +       u32 sub_dev_mask;
> +       struct mutex lock;
> +       struct device *dev;
> +       struct class *adv_ec_class;
> +
> +       struct ec_dynamic_table *dym_tbl;
> +};
> +
> +int read_ad_value(struct adv_ec_platform_data *adv_ec_data, unsigned char hwpin,
> +                       unsigned char multi);
> +int read_acpi_value(struct adv_ec_platform_data *adv_ec_data, unsigned char addr,
> +                       unsigned char *pvalue);
> +int write_acpi_value(struct adv_ec_platform_data *adv_ec_data, unsigned char addr,
> +                       unsigned char value);
> +int read_hw_ram(struct adv_ec_platform_data *adv_ec_data, unsigned char addr,
> +                       unsigned char *data);
> +int write_hw_ram(struct adv_ec_platform_data *adv_ec_data, unsigned char addr,
> +                       unsigned char data);
> +int write_hwram_command(struct adv_ec_platform_data *adv_ec_data, unsigned char data);
> +int read_gpio_status(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> +                       unsigned char *pvalue);
> +int write_gpio_status(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> +                       unsigned char value);
> +int read_gpio_dir(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> +                       unsigned char *pvalue);
> +int write_gpio_dir(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> +                       unsigned char value);
> +
> +#endif /* __LINUX_MFD_AHC1EC0_H */
> --
> 2.17.1
>

Tested-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
