Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 870F0116373
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Dec 2019 19:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfLHSvG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Dec 2019 13:51:06 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33886 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfLHSvG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Dec 2019 13:51:06 -0500
Received: by mail-pg1-f195.google.com with SMTP id r11so5928285pgf.1
        for <linux-watchdog@vger.kernel.org>; Sun, 08 Dec 2019 10:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+LKbq2KAfx1sWiuF+4XUfS8KziqsY3VYk+vPKpcTSEc=;
        b=aXwMI4ajlhYGnsuHOH+Q6NqJZleH3+iSmkY/Ys9cJosMgBUgNwEeTffNyg9FMR56Yh
         KFV4E6SJvZX3wx3z4gWmNqKIbsWRIZd96BkrOrGm0FHf7GhEXdzsDKfG4+b0jlXD6BG6
         lBXcJj/RN+GZ4XyKNJZRk6e7163BHgukBP+yQNTQFcpeEr2lvG09YenrawC9D4/tn9xM
         7Z/KpBm8UP/Z2OBcW02VQ9LJwm9EHimmXQrq9V/JGtUOfZKyF/exPSBfaGL0jls5/ZED
         22esdmYXNfaiHSF8FgsT6P33RqETry9ADdRW+f019vlAFAGrBfeIE+txs99lSau8xBnW
         t2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+LKbq2KAfx1sWiuF+4XUfS8KziqsY3VYk+vPKpcTSEc=;
        b=cC+npPlv6g68OEakWW6S9ok5SnBW0bc+mtDmYi0nLKqK70zzhH9o9XZj1vrY+f41t4
         NpZ9WJKmUbD/MYwQKRnT+w8b+HOOkeYtPg+0S8/6sLjbzldWdh1wRhoZ8H8Tl+/+Bzwd
         wctB72eg3acO78N1WsvNtl2ugBgAlOl8bEGlLfLq76rAt93G3FGwwI9HzYSV5bZU9QW6
         Ob4D6ibyBrzdH4XjkMJRKaJ9npgx1gk+Urmu8mTwiu8ChOMDDuzgKj+FkrLvzYEQN+g9
         32twr710HSum4lo9ZXenPvanh35hiJpIkFOlTjDID5Ak5RZECkiGtyuhoOe5BV/0mF4u
         eLbg==
X-Gm-Message-State: APjAAAXrvVglw042L5LCNbNQs4O44oMHJvusghw3gX01+y6/EFSA9LZY
        hY8FwbdNlNQXs3NOw2Tak6wsZJeT
X-Google-Smtp-Source: APXvYqxnULTsSvXLMBRoESkZUOtBcOLc9ryQAmn+qxMg1i+nv8pftOppiDgUIQKh4eH0zu80leqPow==
X-Received: by 2002:a63:27c4:: with SMTP id n187mr7111226pgn.305.1575831065408;
        Sun, 08 Dec 2019 10:51:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b7sm9740328pjo.3.2019.12.08.10.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2019 10:51:04 -0800 (PST)
Subject: Re: [PATCH] watchdog: Read device status through sysfs attributes for
 GPIO-controlled Watchdog.
To:     harshal chaudhari <harshalchau04@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org
References: <CAFEvwum0uu1p9wK66rFbqFi4YQjfEfZcGd54Yeswk9=0EryP1Q@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <00897846-a86d-8de4-8ecb-f7c79d30e06d@roeck-us.net>
Date:   Sun, 8 Dec 2019 10:51:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEvwum0uu1p9wK66rFbqFi4YQjfEfZcGd54Yeswk9=0EryP1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/8/19 10:45 AM, harshal chaudhari wrote:
> Hi Wim and Guenter,
> 
> This patch adds following attributes to GPIO-controlled watchdog device's sysfs interface to read its different status.
> 
> 
You lost me. What does this patch do that CONFIG_WATCHDOG_SYSFS doesn't do as well ?

Guenter

> * state - reads whether device is active or not
> 
> * identity - reads Watchdog device's identity string.
> 
> * timeout - reads current timeout.
> 
> * bootstatus - reads status of the watchdog device at boot.
> 
> * nowayout - reads whether nowayout feature was set or not.
> 
> 
> Testing with GPIO Watchdog:
> 
> 
> $ cat bootstatus
> 
> 0
> 
> $ cat identity
> 
> GPIO Watchdog
> 
> $ cat nowayout
> 
> 0
> 
> $ cat state
> 
> inactive
> 
> $ cat timeout
> 
> 60
> 
> 
> Signed-off-by: harshal chaudhari <harshalchau04@gmail.com <mailto:harshalchau04@gmail.com>>
> 
> 
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> index 198794963786..762149375280 100644
> --- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> @@ -26,3 +26,31 @@ Example:
>                  hw_algo = "toggle";
>                  hw_margin_ms = <1600>;
>          };
> +
> +
> +* Read device status through sysfs attributes
> +
> +  state - reads whether device is active or not
> +
> +       It is a read only file. It gives active/inactive status of
> +       watchdog device.
> +
> +  identity - reads Watchdog device's identity string.
> +
> +       It is a read only file. It contains identity string of
> +       watchdog device.
> +
> +  timeout - reads current timeout.
> +       It is a read only file. It is read to know about current
> +       value of timeout programmed.
> +
> +  bootstatus - reads status of the watchdog device at boot
> +       It is a read only file. It contains status of the watchdog
> +       device at boot. It is equivalent to WDIOC_GETBOOTSTATUS of
> +       ioctl interface.
> +
> +  nowayout - reads whether nowayout feature was set or not
> +       It is a read only file. While reading, it gives '1' if that
> +       device supports nowayout feature else, it gives '0'.
> +
> +For more details refer the documents as in Documentation/ABI/testing/sysfs-class-watchdog
> 
> diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
> index 0923201ce874..d49eb77ec8f1 100644
> --- a/drivers/watchdog/gpio_wdt.c
> +++ b/drivers/watchdog/gpio_wdt.c
> @@ -90,6 +90,68 @@ static int gpio_wdt_stop(struct watchdog_device *wdd)
>          return 0;
>   }
> 
> +static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
> +                               char *buf)
> +{
> +       struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +       return sprintf(buf, "%u\n", wdd->timeout);
> +}
> +static DEVICE_ATTR_RO(timeout);
> +
> +static ssize_t identity_show(struct device *dev, struct device_attribute *attr,
> +                               char *buf)
> +{
> +       struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +       return sprintf(buf, "%s\n", wdd->info->identity);
> +}
> +static DEVICE_ATTR_RO(identity);
> +
> +static ssize_t state_show(struct device *dev, struct device_attribute *attr,
> +                               char *buf)
> +{
> +       struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +       if (watchdog_active(wdd))
> +               return sprintf(buf, "active\n");
> +
> +       return sprintf(buf, "inactive\n");
> +}
> +static DEVICE_ATTR_RO(state);
> +
> +static ssize_t bootstatus_show(struct device *dev,
> +                               struct device_attribute *attr, char *buf)
> +{
> +       struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +       return sprintf(buf, "%u\n", wdd->bootstatus);
> +}
> +static DEVICE_ATTR_RO(bootstatus);
> +
> +static ssize_t nowayout_show(struct device *dev, struct device_attribute *attr,
> +                               char *buf)
> +{
> +       struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +       return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->status));
> +}
> +static DEVICE_ATTR_RO(nowayout);
> +
> +static struct attribute *wdt_attrs[] = {
> +       &dev_attr_state.attr,
> +       &dev_attr_identity.attr,
> +       &dev_attr_timeout.attr,
> +       &dev_attr_bootstatus.attr,
> +       &dev_attr_nowayout.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group wdt_group = {
> +       .attrs = wdt_attrs,
> +};
> +__ATTRIBUTE_GROUPS(wdt);
> +
>   static const struct watchdog_info gpio_wdt_ident = {
>          .options        = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
>                            WDIOF_SETTIMEOUT,
> @@ -155,6 +217,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
>          priv->wdd.max_hw_heartbeat_ms = hw_margin;
>          priv->wdd.parent        = dev;
>          priv->wdd.timeout       = SOFT_TIMEOUT_DEF;
> +       priv->wdd.groups        = wdt_groups;
> 
>          watchdog_init_timeout(&priv->wdd, 0, dev);
>          watchdog_set_nowayout(&priv->wdd, nowayout);
> 
> 
> 

