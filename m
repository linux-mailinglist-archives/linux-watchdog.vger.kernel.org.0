Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184E85800AB
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Jul 2022 16:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233500AbiGYOYa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 Jul 2022 10:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232874AbiGYOY3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Jul 2022 10:24:29 -0400
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38A814080
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Jul 2022 07:24:27 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.hostpark.net (Postfix) with ESMTP id 111DB16610;
        Mon, 25 Jul 2022 16:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=elsoft.ch; h=
        content-transfer-encoding:content-type:content-type:in-reply-to
        :mime-version:user-agent:date:date:message-id:organization:from
        :from:references:subject:subject:received:received; s=sel2011a;
         t=1658759064; bh=PPPy6JOBVVLBRrHFKFAzd+kHhWFyo5+4nxjLuO9Hn2U=; b=
        XSW8/nmjgu0+L3ZsmmRIDa4nEHjlIjpN11ohDvkWgpY/57hzPbfDTBsU3+/bCH9y
        1Y7Jj/KDzBheLaOV0cwo/fR7EfrBSjE+Q2AiVUk4ePHrwSxUMh9SwnXDbQU2fT7c
        SNBEg5VLjfxHt0JBfJsHTuK+2KGDHiKFWl3ChD/NA98=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
        by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
        with ESMTP id rhVxa4W7dLgG; Mon, 25 Jul 2022 16:24:24 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by mail.hostpark.net (Postfix) with ESMTPA id DAD65164DD;
        Mon, 25 Jul 2022 16:24:24 +0200 (CEST)
Subject: Re: [RFC] [PATCH] watchdog: Exar/MaxLinear XR28V38x driver
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
References: <20220722095104.74635-1-d.mueller@elsoft.ch>
 <a97d3153-3613-77d4-f0a0-5f51ad3b619b@roeck-us.net>
From:   =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Organization: ELSOFT AG
Message-ID: <61171b89-29e7-6486-2259-cab51e18f550@elsoft.ch>
Date:   Mon, 25 Jul 2022 16:24:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 SeaMonkey/2.53.13
MIME-Version: 1.0
In-Reply-To: <a97d3153-3613-77d4-f0a0-5f51ad3b619b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hallo and thanks for your comments

Guenter Roeck schrieb am 22.07.22 um 17:08:
> On 7/22/22 02:51, David Müller wrote:

>> +/* Includes */
> 
> There are various pointless comments in this driver.
> This is one of them.

Ok, will fix.

>> +/* WDT runtime registers */
>> +#define WDT_CTRL    0x00
>> +#define WDT_VAL        0x01
>> +/* the millisec feature is not supported */
> 
> And this is another one. Readers won't know that the unit to be written
> into the chip includes two bits, not juust one, and that 00 reflects
> a 10ms timeout units.
> 
>> +#define WDT_UNITS_SEC    BIT(1)
>> +#define WDT_UNITS_MIN    BIT(2)
> 
> This is a bit misleading, since the two bits combined control the
> interval. That should be explained. The comment above doesn't do this.

What do you purpose / is prefered?

#define WDT_UNITS_MS	0x0	/* not supported / used */
#define WDT_UNITS_SEC	0x2
#define WDT_UNITS_MIN   0x4

or

enum wdt_units {
     WDT_UNITS_MS = 0,		/* not supported / used */
     WDT_UNITS_SEC = 2,
     WDT_UNITS_MIN = 4,
};

or something else?

>> +/* Module parameters */
>> +#define WATCHDOG_TIMEOUT 60        /* 60 sec default timeout */
>> +static int timeout = WATCHDOG_TIMEOUT;    /* in seconds */
> 
> Should be pre-initialized with 0 and the default should be set in struct
> watchdog_device to reduce runtime conplexity.

Ok, will fix.

>> +    /* read the MSB */
>> +    val = exar_sio_read(config_port, reg);
>> +
>> +    /* read and merge in the LSB */
>> +    val = (val << 8) | exar_sio_read(config_port, reg + 1);
>> +
> More pointless comments. Please limit comments to places
> where they are useful.

Ok, will fix.

>> +static void exar_wdt_disarm(const struct wdt_priv *priv)
>> +{
>> +    outb(0xFF, priv->rt_base + WDT_VAL);
>> +    outb(0, priv->rt_base + WDT_VAL);
> 
> The datasheet says that writing a non-0 value stops the watchdog,
> but it doesn't explain what happens when writing 0 into the register.
> This does warrant an explanation.

The datasheet is a little bit unclear about how to correctly stop the 
watchdog. In my tests with actual hardware, the sequence above worked.
But I will check again.

>> +static int exar_wdt_set_timeout(struct watchdog_device *wdog, 
>> unsigned int t)
>> +{
>> +    struct wdt_priv *priv = watchdog_get_drvdata(wdog);
>> +    unsigned char timeout_unit = WDT_UNITS_SEC;
>> +
>> +    if (watchdog_timeout_invalid(wdog, t))
>> +        return -EINVAL;
>> +
> Unnecessary check; done by framework.

Ok, will fix.

>> +    /*
>> +     * if new timeout is bigger then 255 seconds, change the
>> +     * unit to minutes and round the timeout up to the next whole minute
>> +     */
>> +    if (t > 255) {
>> +        timeout_unit = WDT_UNITS_MIN;
>> +        t = DIV_ROUND_UP(t, 60);
>> +    }
>> +
>> +    /* save for later use in exar_wdt_start() */
>> +    priv->unit = timeout_unit;
> 
> Using a bool for timeout_unit would make it easier for the compiler.
> 
>> +    priv->timeout = t;
>> +
>> +    wdog->timeout = (timeout_unit == WDT_UNITS_MIN) ? t * 60 : t;
>> +
> 
> This doesn't update the watchdog registers when the watchdog is running.
> This means that the watchdog may fire unexpectedly if the timeout is
> changed from a small to a large value.

Is there a reason why the framework does not issue a stop(), update(), 
start() sequence when the timeout value is changed?
>> +    ret = exar_sio_enter(config_port, key);
>> +    if (ret) {
>> +        pr_info("config space unavailable\n (err: %d", ret);
> 
> Please no such noise. Also, there is an unbalanced ( in the string.

Ok, will fix.

>> +        return 0;
>> +    }
>> +
>> +    vid = exar_sio_read16(config_port, EXAR_VID);
>> +    did = exar_sio_read16(config_port, EXAR_DID);
>> +
>> +    /* check for the vendor and device IDs we currently know about */
>> +    if (vid == 0x13A8 &&        /* vendor Exar/MaxLinar */
>> +        (did == 0x0382 ||        /* UART XR28V382 */
>> +         did == 0x0384)) {        /* UART XR28V384 */
> 
> It might be useful to have defines for those values.

Ok, will fix.

>> +        /* set LD config reg to WDT device (8) */
>> +        exar_sio_write(config_port, EXAR_LDN, 8);
>> +        /* is device active? */
>> +        if (exar_sio_read(config_port, EXAR_ACT) == 0x01) {
>> +            /* get the WDT runtime registers base address*/
>> +            base = exar_sio_read16(config_port, EXAR_RTBASE);
>> +
>> +            /* set global WDT control to
>> +             * assert WDTOUT / rearm by read
>> +             */
> 
> Please use standard multi-line comments.

Ok, will fix.

>> +            exar_sio_write(config_port, EXAR_WDT, 0);
> 
> The detect function should really not do this. Configuration and detection
> should be separate functions.

Ok, will fix.

>> +static int __init exar_wdt_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct wdt_priv *priv;
>> +    int ret, i, j;
>> +    unsigned short did = 0, rt_base = 0;
>> +
>> +    /* search for the first active Exar WDT on all possible locations */
>> +    for (i = 0; !did && (i < ARRAY_SIZE(sio_config_ports)); i++) {
>> +        for (j = 0; !did && (j < ARRAY_SIZE(sio_enter_keys)); j++)
>> +            did = exar_detect(sio_config_ports[i],
>> +                      sio_enter_keys[j],
>> +                      &rt_base);
>> +    }
>> +
>> +    if (!did)
>> +        return -ENODEV;
> 
> This should really be done in the init function, and the init function 
> should only instantiate the watchdog platform driver if a device was found.

Ok, will move the detection part to the init() function.

> Also, this assumes either that only one supported device is in the system,
> or that the watchdog is always connected to the first device. The init
> function should really instantiate devices for each detected chip,
> not just for the first one.

Yes, only one active Exar WDT device is supported.
Even if there are multiple Exar UART chips present in the system, it
doesn't make much sense to have more than one Exar WDT active and 
supported at a time IMHO.

>> +    if (watchdog_timeout_invalid(&wdt_dev, timeout))
>> +        /* invalid timeout specified, reset to default */
>> +        timeout = WATCHDOG_TIMEOUT;
> 
> It would be easier to just initialize .timeout in struct watchdog_device
> and let watchdog_init_timeout() validate the configured value.

Ok, will fix.

>> +    if (!devm_request_region(dev,
>> +                 priv->rt_base + WDT_CTRL, 2, DRV_NAME)) {
>> +        dev_err(dev, "failed to request region 0x%04x-0x%04x.\n",
>> +            priv->rt_base + WDT_CTRL, priv->rt_base + WDT_VAL);
>> +        return -EBUSY;
> 
> This should be -ENOMEM.

Ok, will fix.
