Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C998116EC8
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Dec 2019 15:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfLIOO2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 Dec 2019 09:14:28 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:47042 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfLIOO2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 Dec 2019 09:14:28 -0500
Received: by mail-pl1-f193.google.com with SMTP id k20so5851302pll.13
        for <linux-watchdog@vger.kernel.org>; Mon, 09 Dec 2019 06:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qXnInI6A0dgkJrZkaliWr9mj703E+aAHcxaLn6Vzu5w=;
        b=PdcuknemxRnXsu48q58hYfvlECiNU45OKUgtD/iIOCxZTX5RhXE9Vf/jv6XCSIxdeM
         mkqABP01l5jfgxHFATciXd8vx9IYKTVsZeLSJy52ph9haM7APlJC6ei6DKspuX4gCVV3
         79oXiC10MGQwqHhvWJ2+rZXI+uZ64n8LRGa5ZwYzdQwwtDTaaBv0uSIum929Awakfsry
         Yp+yU99/I0jDMOeIOfR+GpgNkQV3c6jE8YRi83d8ymZdABaXzb3DyNhVJM7F49xRGPtN
         y1n2ClV4XyhSU0rdU/GNfiq21wJ6SDtntb4pz0uc7me4ZjFottjybS+ZV/5bg7gz9Yc/
         nkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qXnInI6A0dgkJrZkaliWr9mj703E+aAHcxaLn6Vzu5w=;
        b=qa+VJDsAaSMk7ssElWOVQoRPsCNShll7uo0DXQifi/AaxNqdrhB83OqMnkiM6iejh4
         KGCdDGrFTKsLsf8oQa7vqqSmscagIDJk9d3ATYEAiv5nD2/ja7Ft/RMxaSmMFUg/TqKM
         IFn0aT/UW+p3biXkG/R06ea6eU8I3Nb0jeO93eK7Ku0Odc6uDRL0GHRpmCQUI96hdGuh
         ymbGWUAHjXTC18p1XLxB9/BN+HOit2Zh885tt2o+WdHQfwteLjDgChaN4Hn3QpaIGice
         xI0GMHRRMXif6nXj/R+q0ldptBsP1tvbIHXi9GxAjWyjGb/pUL+vGNXygGfopECyzmjQ
         YVcw==
X-Gm-Message-State: APjAAAUuW0xjgsJKc5rukaowRylME5/XC6z3eIpXJsHY55F/XVxWwBXQ
        LocQAbvj/lf24E1dCjw/BRxszojZ
X-Google-Smtp-Source: APXvYqyuK3eIUHvbXyhzF3HrWcDCqlPAontKxOTmfuDxIFviWVgG/5P5H4+5pJnmxQVZJp/JmNyZ/g==
X-Received: by 2002:a17:90b:244:: with SMTP id fz4mr33315210pjb.27.1575900867407;
        Mon, 09 Dec 2019 06:14:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e23sm12826950pjt.23.2019.12.09.06.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2019 06:14:25 -0800 (PST)
Subject: Re: [PATCH] watchdog: Read device status through sysfs attributes for
 GPIO-controlled Watchdog.
To:     harshal chaudhari <harshalchau04@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
References: <CAFEvwum0uu1p9wK66rFbqFi4YQjfEfZcGd54Yeswk9=0EryP1Q@mail.gmail.com>
 <00897846-a86d-8de4-8ecb-f7c79d30e06d@roeck-us.net>
 <CAFEvwu=0ge4D7CPVwu3D+wLu_5T=8GTjhFFi6D97m6Nxkga5Ew@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0d333176-e727-da65-a9f9-f4bf200a2a98@roeck-us.net>
Date:   Mon, 9 Dec 2019 06:14:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEvwu=0ge4D7CPVwu3D+wLu_5T=8GTjhFFi6D97m6Nxkga5Ew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/9/19 2:41 AM, harshal chaudhari wrote:
> Hi Guenter,
> 
> Its does the same thing as WATCH_DOG_SYSFS does, but i just want to add this functionality in *gpio_wdt* driver in next release because this driver is widely used in IOT gateways, and sysfs is very useful for monitoring the watchdog device. that's it.
> 
> 

This doesn't make sense. All you need to do is to enable WATCHDOG_SYSFS.
NACK, sorry.

Guenter

> 
> 
> 
> On Mon, Dec 9, 2019 at 12:21 AM Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
> 
>     On 12/8/19 10:45 AM, harshal chaudhari wrote:
>      > Hi Wim and Guenter,
>      >
>      > This patch adds following attributes to GPIO-controlled watchdog device's sysfs interface to read its different status.
>      >
>      >
>     You lost me. What does this patch do that CONFIG_WATCHDOG_SYSFS doesn't do as well ?
> 
>     Guenter
> 
>      > * state - reads whether device is active or not
>      >
>      > * identity - reads Watchdog device's identity string.
>      >
>      > * timeout - reads current timeout.
>      >
>      > * bootstatus - reads status of the watchdog device at boot.
>      >
>      > * nowayout - reads whether nowayout feature was set or not.
>      >
>      >
>      > Testing with GPIO Watchdog:
>      >
>      >
>      > $ cat bootstatus
>      >
>      > 0
>      >
>      > $ cat identity
>      >
>      > GPIO Watchdog
>      >
>      > $ cat nowayout
>      >
>      > 0
>      >
>      > $ cat state
>      >
>      > inactive
>      >
>      > $ cat timeout
>      >
>      > 60
>      >
>      >
>      > Signed-off-by: harshal chaudhari <harshalchau04@gmail.com <mailto:harshalchau04@gmail.com> <mailto:harshalchau04@gmail.com <mailto:harshalchau04@gmail.com>>>
>      >
>      >
>      >
>      > diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>      > index 198794963786..762149375280 100644
>      > --- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>      > +++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>      > @@ -26,3 +26,31 @@ Example:
>      >                  hw_algo = "toggle";
>      >                  hw_margin_ms = <1600>;
>      >          };
>      > +
>      > +
>      > +* Read device status through sysfs attributes
>      > +
>      > +  state - reads whether device is active or not
>      > +
>      > +       It is a read only file. It gives active/inactive status of
>      > +       watchdog device.
>      > +
>      > +  identity - reads Watchdog device's identity string.
>      > +
>      > +       It is a read only file. It contains identity string of
>      > +       watchdog device.
>      > +
>      > +  timeout - reads current timeout.
>      > +       It is a read only file. It is read to know about current
>      > +       value of timeout programmed.
>      > +
>      > +  bootstatus - reads status of the watchdog device at boot
>      > +       It is a read only file. It contains status of the watchdog
>      > +       device at boot. It is equivalent to WDIOC_GETBOOTSTATUS of
>      > +       ioctl interface.
>      > +
>      > +  nowayout - reads whether nowayout feature was set or not
>      > +       It is a read only file. While reading, it gives '1' if that
>      > +       device supports nowayout feature else, it gives '0'.
>      > +
>      > +For more details refer the documents as in Documentation/ABI/testing/sysfs-class-watchdog
>      >
>      > diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
>      > index 0923201ce874..d49eb77ec8f1 100644
>      > --- a/drivers/watchdog/gpio_wdt.c
>      > +++ b/drivers/watchdog/gpio_wdt.c
>      > @@ -90,6 +90,68 @@ static int gpio_wdt_stop(struct watchdog_device *wdd)
>      >          return 0;
>      >   }
>      >
>      > +static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
>      > +                               char *buf)
>      > +{
>      > +       struct watchdog_device *wdd = dev_get_drvdata(dev);
>      > +
>      > +       return sprintf(buf, "%u\n", wdd->timeout);
>      > +}
>      > +static DEVICE_ATTR_RO(timeout);
>      > +
>      > +static ssize_t identity_show(struct device *dev, struct device_attribute *attr,
>      > +                               char *buf)
>      > +{
>      > +       struct watchdog_device *wdd = dev_get_drvdata(dev);
>      > +
>      > +       return sprintf(buf, "%s\n", wdd->info->identity);
>      > +}
>      > +static DEVICE_ATTR_RO(identity);
>      > +
>      > +static ssize_t state_show(struct device *dev, struct device_attribute *attr,
>      > +                               char *buf)
>      > +{
>      > +       struct watchdog_device *wdd = dev_get_drvdata(dev);
>      > +
>      > +       if (watchdog_active(wdd))
>      > +               return sprintf(buf, "active\n");
>      > +
>      > +       return sprintf(buf, "inactive\n");
>      > +}
>      > +static DEVICE_ATTR_RO(state);
>      > +
>      > +static ssize_t bootstatus_show(struct device *dev,
>      > +                               struct device_attribute *attr, char *buf)
>      > +{
>      > +       struct watchdog_device *wdd = dev_get_drvdata(dev);
>      > +
>      > +       return sprintf(buf, "%u\n", wdd->bootstatus);
>      > +}
>      > +static DEVICE_ATTR_RO(bootstatus);
>      > +
>      > +static ssize_t nowayout_show(struct device *dev, struct device_attribute *attr,
>      > +                               char *buf)
>      > +{
>      > +       struct watchdog_device *wdd = dev_get_drvdata(dev);
>      > +
>      > +       return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->status));
>      > +}
>      > +static DEVICE_ATTR_RO(nowayout);
>      > +
>      > +static struct attribute *wdt_attrs[] = {
>      > +       &dev_attr_state.attr,
>      > +       &dev_attr_identity.attr,
>      > +       &dev_attr_timeout.attr,
>      > +       &dev_attr_bootstatus.attr,
>      > +       &dev_attr_nowayout.attr,
>      > +       NULL,
>      > +};
>      > +
>      > +static const struct attribute_group wdt_group = {
>      > +       .attrs = wdt_attrs,
>      > +};
>      > +__ATTRIBUTE_GROUPS(wdt);
>      > +
>      >   static const struct watchdog_info gpio_wdt_ident = {
>      >          .options        = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
>      >                            WDIOF_SETTIMEOUT,
>      > @@ -155,6 +217,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
>      >          priv->wdd.max_hw_heartbeat_ms = hw_margin;
>      >          priv->wdd.parent        = dev;
>      >          priv->wdd.timeout       = SOFT_TIMEOUT_DEF;
>      > +       priv->wdd.groups        = wdt_groups;
>      >
>      >          watchdog_init_timeout(&priv->wdd, 0, dev);
>      >          watchdog_set_nowayout(&priv->wdd, nowayout);
>      >
>      >
>      >
> 

