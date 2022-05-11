Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00038522B83
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 May 2022 07:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235588AbiEKFIp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 May 2022 01:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiEKFIo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 May 2022 01:08:44 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C773E532D0
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 22:08:42 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id gj17-20020a17090b109100b001d8b390f77bso3875686pjb.1
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 22:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FDP95LMRIVdzlCKOfYu0ttRo/GdmmdwnD1Dhlc4+Cyg=;
        b=s0XWaX611Ffi2miPM6YXBG2tZNVEyxMOFrv3NvlW4DecJCfVt0mZofzsbIvlo7bRKF
         j83thcrXHJVK34XNe5R2u11qsInOtA9OOBtS4W56I1rb0qbX8YCfg6fECKt9Gj6KkReK
         FozMSEpBQaXH8REKD0+VbdPUd7le8nBkOcGX0f1XS95/o4OeXk67ylphhQY/dQfFZ4oX
         BX3hk0I1jTtg9+Y/V2hlqHS1UcYeZu3gNKbPY+/BFxAAen/zr6eghH1RYYDUynEwAp50
         VAWdwHnDDXCYbYiTqyoVaPRHDKWrvVSSixm3Fq62BvxDGhBFUKeM+ycjiX58c+uDME3x
         letw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FDP95LMRIVdzlCKOfYu0ttRo/GdmmdwnD1Dhlc4+Cyg=;
        b=wfZPEtA3eWyknwHdYLdLNiqyyMOZjonnwC0B2V8POiu/WPkg4fwYdKD1ePV2hBVYjf
         iX5DyNYlgCylxHcCWE395nPia/2MHxH6OV0aGeRi1BJYTYZEXGbUP9qZMR266snUAaDN
         hwMaDSCLrn66RSANfDDiGRIk3YtWnFKOloXzG6/dwTG5WUaSMyRtDH0PlHhrmGyTWQYd
         v+CooyrjbmNrAsSdqOwtcuFFtqUHX0OGkcJN6RQk8lTM1GOtgWvp+/+n9wewIV3Kw/9i
         B/SGP3cjbZnopUwQxITcatQxi8VYLQZrhhF6uG5PJSaqG0bQXaq6qcZswArLupregUoI
         ScFg==
X-Gm-Message-State: AOAM532oC8Kkj6rA7qC5aAqDBJLCK/AFZZ1MSdcDN/wKOJLFhAELYGuc
        30rRVcWJnRcolPNXkJDByW7d4g==
X-Google-Smtp-Source: ABdhPJyP22mlDbZmYc8zfZqNtg3KMu+P0rZ+PJ1HLQUIq5cMzHAbLWZ7e2APkqX4cRrQuMugrlVl4g==
X-Received: by 2002:a17:90b:4a4f:b0:1dc:79d9:8505 with SMTP id lb15-20020a17090b4a4f00b001dc79d98505mr3459134pjb.43.1652245722171;
        Tue, 10 May 2022 22:08:42 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id y3-20020a626403000000b0050dc76281b6sm504370pfb.144.2022.05.10.22.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 22:08:41 -0700 (PDT)
Message-ID: <4f829857-5255-58d9-c3f4-7bc33980e4f6@ozlabs.ru>
Date:   Wed, 11 May 2022 15:08:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [RFC v2 2/2] watchdog: pseries-wdt: initial support for PAPR
 virtual watchdog timers
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Scott Cheloha <cheloha@linux.ibm.com>
Cc:     linux-watchdog@vger.kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, npiggin@gmail.com, vaishnavi@linux.ibm.com,
        wvoigt@us.ibm.com
References: <20220509174357.5448-1-cheloha@linux.ibm.com>
 <20220509174357.5448-3-cheloha@linux.ibm.com> <YnnPdv+Hh9UEHMu/@google.com>
 <052b9903-e405-f6d0-444c-24d22bb85ad4@roeck-us.net>
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <052b9903-e405-f6d0-444c-24d22bb85ad4@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 5/10/22 13:34, Guenter Roeck wrote:
> On 5/9/22 19:35, Tzung-Bi Shih wrote:
>> On Mon, May 09, 2022 at 12:43:57PM -0500, Scott Cheloha wrote:
>>> +#define SETFIELD(_v, _b, _e)    \
>>> +    (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), 
>>> (_e)))
>>> +#define GETFIELD(_v, _b, _e)    \
>>> +    (((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> 
>>> PPC_BITLSHIFT(_e))
>>
>>> From `./scripts/checkpatch.pl --strict`:
>> WARNING: please, no spaces at the start of a line
>>
>>> +#define PSERIES_WDTQL_MUST_STOP           1
>>
>>> From `./scripts/checkpatch.pl --strict`:
>> WARNING: please, no space before tabs
>>
>>> +static const struct kernel_param_ops action_ops = { .set = 
>>> action_set };
>>> +module_param_cb(action, &action_ops, NULL, S_IRUGO);
>>
>>> From `./scripts/checkpatch.pl --strict`:
>> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
>> octal permissions '0444'.
>>
>>> +MODULE_PARM_DESC(action, "Action taken when watchdog expires: 
>>> \"hard-poweroff\", \"hard-restart\", or \"dump-restart\" 
>>> (default=\"hard-restart\")");
>>
>> The line exceeds 100 columns.
>>
>>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>>> +module_param(nowayout, bool, S_IRUGO);
>>
>>> From `./scripts/checkpatch.pl --strict`:
>> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
>> octal permissions '0444'.
>>
>>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started 
>>> (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>
>>> From `./scripts/checkpatch.pl --strict`, the line exceeds 100 columns.
>>
>>> +#define WATCHDOG_TIMEOUT 60
>>> +static unsigned int timeout = WATCHDOG_TIMEOUT;
>>> +module_param(timeout, uint, S_IRUGO);
>>
>>> From `./scripts/checkpatch.pl --strict`:
>> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
>> octal permissions '0444'.
>>
>>> +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds 
>>> (default=" __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
>>
>>> From `./scripts/checkpatch.pl --strict`, the line exceeds 100 columns.
>>
>>> +struct pseries_wdt {
>>> +    struct watchdog_device wd;
>>> +    unsigned long num;        /* NB: Watchdog numbers are 1-based */
>>
>> What does NB stand for?  Could it be removed from the comment?
>>
> 
> Latin "Nota Bene", for "This is important".
> All comments should be important, so I agree, this has little
> if any value.
> 
>> Does `timer_id` or some other equivalent names make more sense for the
>> variable?
>>
>>> +static int pseries_wdt_start(struct watchdog_device *wdd)
>>> +{
>> [...]
>>> +    rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
>>> +    if (rc != H_SUCCESS) {
>>> +        dev_crit(dev, "H_WATCHDOG: %ld: failed to start timer %lu",
>>> +             rc, pw->num);
>>> +               return -EIO;
>>
>>> From `./scripts/checkpatch.pl --strict`:
>> ERROR: code indent should use tabs where possible
>> WARNING: please, no space before tabs
>>
>>> +static struct watchdog_info pseries_wdt_info = {
>>> +    .identity = DRV_NAME,
>>> +    .options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | 
>>> WDIOF_SETTIMEOUT \
>>> +        | WDIOF_PRETIMEOUT,
>>
>>> From `./scripts/checkpatch.pl --strict`:
>> WARNING: Avoid unnecessary line continuations
>>
>>> +static const struct watchdog_ops pseries_wdt_ops = {
>>> +    .owner = THIS_MODULE,
>>> +    .ping = pseries_wdt_start,
>>
>> Does this mean: it needs hard restart for every ping?
>>
> 
> If there is no separate ping function, there is no need to point
> the ping function to the start function. The watchdog core uses
> the start function automatically in this case.
> 
>>> +static int pseries_wdt_probe(struct platform_device *pdev)
>>> +{
>> [...]
>>> +    rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
>>> +    if (rc != H_SUCCESS)
>>> +        return (rc == H_FUNCTION) ? -ENODEV : -EIO;
>>
>> The parentheses can be dropped.
>>
>>> +    pw = devm_kzalloc(&pdev->dev, sizeof *pw, GFP_KERNEL);
>>> +    if (pw == NULL)
>>
>>> From `./scripts/checkpatch.pl --strict`:
>> CHECK: Comparison to NULL could be written "!pw"
>>
>>> +    pw->num = pdev->id + 1;        /* 0-based -> 1-based */
>>
>> Didn't see where the platform device was registered but using the 
>> pdev->id as
>> the timer id could be unreliable (e.g. from auto increment).
> 
> That is at the beginning of the patch, in 
> arch/powerpc/platforms/pseries/setup.c,
> which calls platform_device_register_simple() with an explicit device ID.
> 
> I agree, though, that it is fragile: The code in the probe function
> explicitly checks for a negative ID, which would only be provided if
> platform_device_register() explicitly declares that (ie if it provides
> PLATFORM_DEVID_NONE as device ID). But if that is a concern, there
> might as well be code registering a platform device with
> PLATFORM_DEVID_AUTO as device ID, and then th device id would be automatic
> and more or less random. I think the instantiation code should be more
> explicit: Either assume that PLATFORM_DEVID_NONE or PLATFORM_DEVID_AUTO
> will never be used to register the watchdog devices, or provide other
> information such as platform data to make it explicit.
> 
> Also, the changes in arch code need to be made in separate patches.


Often this is true but in case like this - the driver itself is dead 
code until the platform enables it and if there is a problem with the 
driver - bisect will point to the device enablement commit. Backporting 
becomes a problem as it is going to be 3 apart patches vs. one:
1) define hypercall
2) implement the driver
3) enable the driver + device FW feature flag.

Instead, either maintainer (powerpc or watchdog) says "ack" and the 
other one puts it in the tree, I saw this in practice. Thanks,



> Thanks,
> Guenter

-- 
Alexey
