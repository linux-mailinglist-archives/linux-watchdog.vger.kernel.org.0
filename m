Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8853A5803A7
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Jul 2022 19:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiGYRtw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 Jul 2022 13:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiGYRtw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Jul 2022 13:49:52 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17FEBF64
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Jul 2022 10:49:50 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ku18so11195711pjb.2
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Jul 2022 10:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=cNG0bdB/LrMkd/JRV2S0Dl/cLBGOu5QRYjQryWwpiL0=;
        b=Pn7+vwpXFQcPaBZ9YV58iaSK11dE+sZZOb7vn4EKVtQ1asJ4xvlwSo7UJDKuAL+57/
         b+gKEQVovpwcqWgCPgDiOct1CCJkycKXYWDJCu8uAeRhCyTl4RyPPkWBt1u3yr7HCF46
         lU7kB9qKdiDW2uab4t4b82Ym7mNo4ahLFAYmsR8WuDE93jpeIYzh6P3zXks2JiGs+WFW
         tY3W6fhsSIQ245A4E5SEU4B6XaPNvCJol4xXAQaW4QJcsmIA+sbWOa5YVYjR/h+qXbue
         gK+ow+dr+Nr6g1jh0YiSBE5jYJ2F45tJfCGbtG7f3JRILnaZeo1XYxjfmMBHEjh7zFhW
         zibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=cNG0bdB/LrMkd/JRV2S0Dl/cLBGOu5QRYjQryWwpiL0=;
        b=Wz11ApIRNBSVR7NBT4/WipJMfJ+Cg70qywKHO878pxHJPntuzouIBBUfZbJtrXAEiL
         dBAAT8Ao++H5G3LPEj/aavc1r5gtsKuHDUVaT3ffx7cMBaYWNhfPpqQBRC9LrCTLP8lW
         PY3oHJydnQ4tHicfQ2H7aFIt4MiB9U1+PmTe1q5D3tDGzALLC2kxPvVLmpROId5OyHuz
         m5lOorShAYFT5G8h9nLEe6U7oYOHyj5z3KGrw4VGI0a6S0tDuGDR/sonVm/BwF6CnKJG
         f6UjhLdfLKncE1XIcKRZQNDAMRMhdufzoOFu6mXZbnkH/uE3sTzY5GE5dMc74B6p/nxq
         4mNg==
X-Gm-Message-State: AJIora/FxdXNbRX1/cHuzi7OmZe3YlKtpk6Cjz5lrL8NBFdc7fuJg/BG
        h0dSvKGYYAj+BwD4hVKgmAr5d0DMiRpu2A==
X-Google-Smtp-Source: AGRyM1u68Vf2peQNBckB/4QUoiXclRRT3fNth6CX7oMfiicBJNV/mO1i99j+Sh+Hc9Q7GT8ZTGBceQ==
X-Received: by 2002:a17:902:e54d:b0:16d:6bd8:58cd with SMTP id n13-20020a170902e54d00b0016d6bd858cdmr7439339plf.66.1658771390247;
        Mon, 25 Jul 2022 10:49:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ik18-20020a170902ab1200b0016d9a17c8e0sm95125plb.68.2022.07.25.10.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 10:49:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ea6f9a9f-6849-4dc4-d2d3-29c72e7d9a8f@roeck-us.net>
Date:   Mon, 25 Jul 2022 10:49:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>,
        linux-watchdog@vger.kernel.org
References: <20220722095104.74635-1-d.mueller@elsoft.ch>
 <a97d3153-3613-77d4-f0a0-5f51ad3b619b@roeck-us.net>
 <61171b89-29e7-6486-2259-cab51e18f550@elsoft.ch>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC] [PATCH] watchdog: Exar/MaxLinear XR28V38x driver
In-Reply-To: <61171b89-29e7-6486-2259-cab51e18f550@elsoft.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/25/22 07:24, David Müller (ELSOFT AG) wrote:
> Hallo and thanks for your comments
> 
> Guenter Roeck schrieb am 22.07.22 um 17:08:
>> On 7/22/22 02:51, David Müller wrote:
> 
>>> +/* Includes */
>>
>> There are various pointless comments in this driver.
>> This is one of them.
> 
> Ok, will fix.
> 
>>> +/* WDT runtime registers */
>>> +#define WDT_CTRL    0x00
>>> +#define WDT_VAL        0x01
>>> +/* the millisec feature is not supported */
>>
>> And this is another one. Readers won't know that the unit to be written
>> into the chip includes two bits, not juust one, and that 00 reflects
>> a 10ms timeout units.
>>
>>> +#define WDT_UNITS_SEC    BIT(1)
>>> +#define WDT_UNITS_MIN    BIT(2)
>>
>> This is a bit misleading, since the two bits combined control the
>> interval. That should be explained. The comment above doesn't do this.
> 
> What do you purpose / is prefered?
> 
> #define WDT_UNITS_MS    0x0    /* not supported / used */
> #define WDT_UNITS_SEC    0x2
> #define WDT_UNITS_MIN   0x4
> 
> or
> 
> enum wdt_units {
>      WDT_UNITS_MS = 0,        /* not supported / used */
>      WDT_UNITS_SEC = 2,
>      WDT_UNITS_MIN = 4,
> };
> 
> or something else?
> 
Either one. A comment would do as well. This is where a comment is useful.

>>> +/* Module parameters */
>>> +#define WATCHDOG_TIMEOUT 60        /* 60 sec default timeout */
>>> +static int timeout = WATCHDOG_TIMEOUT;    /* in seconds */
>>
>> Should be pre-initialized with 0 and the default should be set in struct
>> watchdog_device to reduce runtime conplexity.
> 
> Ok, will fix.
> 
>>> +    /* read the MSB */
>>> +    val = exar_sio_read(config_port, reg);
>>> +
>>> +    /* read and merge in the LSB */
>>> +    val = (val << 8) | exar_sio_read(config_port, reg + 1);
>>> +
>> More pointless comments. Please limit comments to places
>> where they are useful.
> 
> Ok, will fix.
> 
>>> +static void exar_wdt_disarm(const struct wdt_priv *priv)
>>> +{
>>> +    outb(0xFF, priv->rt_base + WDT_VAL);
>>> +    outb(0, priv->rt_base + WDT_VAL);
>>
>> The datasheet says that writing a non-0 value stops the watchdog,
>> but it doesn't explain what happens when writing 0 into the register.
>> This does warrant an explanation.
> 
> The datasheet is a little bit unclear about how to correctly stop the watchdog. In my tests with actual hardware, the sequence above worked.
> But I will check again.
> 

Again, this is where a comment would be useful (eg explain that just writing 0xff
is insufficient, and that writing 0 was found to be necessary to actually stop
the watchdog reliably).

>>> +static int exar_wdt_set_timeout(struct watchdog_device *wdog, unsigned int t)
>>> +{
>>> +    struct wdt_priv *priv = watchdog_get_drvdata(wdog);
>>> +    unsigned char timeout_unit = WDT_UNITS_SEC;
>>> +
>>> +    if (watchdog_timeout_invalid(wdog, t))
>>> +        return -EINVAL;
>>> +
>> Unnecessary check; done by framework.
> 
> Ok, will fix.
> 
>>> +    /*
>>> +     * if new timeout is bigger then 255 seconds, change the
>>> +     * unit to minutes and round the timeout up to the next whole minute
>>> +     */
>>> +    if (t > 255) {
>>> +        timeout_unit = WDT_UNITS_MIN;
>>> +        t = DIV_ROUND_UP(t, 60);
>>> +    }
>>> +
>>> +    /* save for later use in exar_wdt_start() */
>>> +    priv->unit = timeout_unit;
>>
>> Using a bool for timeout_unit would make it easier for the compiler.
>>
>>> +    priv->timeout = t;
>>> +
>>> +    wdog->timeout = (timeout_unit == WDT_UNITS_MIN) ? t * 60 : t;
>>> +
>>
>> This doesn't update the watchdog registers when the watchdog is running.
>> This means that the watchdog may fire unexpectedly if the timeout is
>> changed from a small to a large value.
> 
> Is there a reason why the framework does not issue a stop(), update(), start() sequence when the timeout value is changed?

The framework does not know what each individual watchdog needs.
It is undesirable to stop the watchdog when changing the timeout,
but some watchdogs need it.

>>> +    ret = exar_sio_enter(config_port, key);
>>> +    if (ret) {
>>> +        pr_info("config space unavailable\n (err: %d", ret);
>>
>> Please no such noise. Also, there is an unbalanced ( in the string.
> 
> Ok, will fix.
> 
>>> +        return 0;
>>> +    }
>>> +
>>> +    vid = exar_sio_read16(config_port, EXAR_VID);
>>> +    did = exar_sio_read16(config_port, EXAR_DID);
>>> +
>>> +    /* check for the vendor and device IDs we currently know about */
>>> +    if (vid == 0x13A8 &&        /* vendor Exar/MaxLinar */
>>> +        (did == 0x0382 ||        /* UART XR28V382 */
>>> +         did == 0x0384)) {        /* UART XR28V384 */
>>
>> It might be useful to have defines for those values.
> 
> Ok, will fix.
> 
>>> +        /* set LD config reg to WDT device (8) */
>>> +        exar_sio_write(config_port, EXAR_LDN, 8);
>>> +        /* is device active? */
>>> +        if (exar_sio_read(config_port, EXAR_ACT) == 0x01) {
>>> +            /* get the WDT runtime registers base address*/
>>> +            base = exar_sio_read16(config_port, EXAR_RTBASE);
>>> +
>>> +            /* set global WDT control to
>>> +             * assert WDTOUT / rearm by read
>>> +             */
>>
>> Please use standard multi-line comments.
> 
> Ok, will fix.
> 
>>> +            exar_sio_write(config_port, EXAR_WDT, 0);
>>
>> The detect function should really not do this. Configuration and detection
>> should be separate functions.
> 
> Ok, will fix.
> 
>>> +static int __init exar_wdt_probe(struct platform_device *pdev)
>>> +{
>>> +    struct device *dev = &pdev->dev;
>>> +    struct wdt_priv *priv;
>>> +    int ret, i, j;
>>> +    unsigned short did = 0, rt_base = 0;
>>> +
>>> +    /* search for the first active Exar WDT on all possible locations */
>>> +    for (i = 0; !did && (i < ARRAY_SIZE(sio_config_ports)); i++) {
>>> +        for (j = 0; !did && (j < ARRAY_SIZE(sio_enter_keys)); j++)
>>> +            did = exar_detect(sio_config_ports[i],
>>> +                      sio_enter_keys[j],
>>> +                      &rt_base);
>>> +    }
>>> +
>>> +    if (!did)
>>> +        return -ENODEV;
>>
>> This should really be done in the init function, and the init function should only instantiate the watchdog platform driver if a device was found.
> 
> Ok, will move the detection part to the init() function.
> 
>> Also, this assumes either that only one supported device is in the system,
>> or that the watchdog is always connected to the first device. The init
>> function should really instantiate devices for each detected chip,
>> not just for the first one.
> 
> Yes, only one active Exar WDT device is supported.
> Even if there are multiple Exar UART chips present in the system, it
> doesn't make much sense to have more than one Exar WDT active and supported at a time IMHO.
> 

How do you know which one is the active one, ie the one connected to a reset pin ?
Also, at least for my part, I often use more than one watchdog if multiple watchdogs
are supported in the system. Your use case may not want/need it, but there may be
other use cases.

>>> +    if (watchdog_timeout_invalid(&wdt_dev, timeout))
>>> +        /* invalid timeout specified, reset to default */
>>> +        timeout = WATCHDOG_TIMEOUT;
>>
>> It would be easier to just initialize .timeout in struct watchdog_device
>> and let watchdog_init_timeout() validate the configured value.
> 
> Ok, will fix.
> 
>>> +    if (!devm_request_region(dev,
>>> +                 priv->rt_base + WDT_CTRL, 2, DRV_NAME)) {
>>> +        dev_err(dev, "failed to request region 0x%04x-0x%04x.\n",
>>> +            priv->rt_base + WDT_CTRL, priv->rt_base + WDT_VAL);
>>> +        return -EBUSY;
>>
>> This should be -ENOMEM.
> 
> Ok, will fix.

