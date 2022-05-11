Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82885522BA1
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 May 2022 07:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238666AbiEKF14 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 May 2022 01:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238431AbiEKF1z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 May 2022 01:27:55 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A0012FC00
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 22:27:54 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id n24so1444073oie.12
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 22:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=qWGxM8AcVbSstzS1YTcot+dFEQPX4lNxBkuhOR/NeDQ=;
        b=Oz+haNs15YQyEK4SLQMvFfoFkI172rw9/rbMIHfh0VCdWXKR2b5aDxO80jLx8BfOI9
         yYet5fdm+jj1ss9oRUnjWo9PsfpmfM+ZhxOfKLjRSGTQ/h1zZJZgnw3g2TnWxjZU8y5L
         IWPobZmKR7TCwZmfdfRDWjdjV6jcenP7QJYde7svcscd1UDayfpFmaD9+0rsYsaWB8b1
         pjQ31fjturHNUnIBTl8J7z25CATT1VEfWKqaP3Y5tk4AcHNwM+E00PJqgqAQybMTblNv
         ZVr+cHdSy+OUJdJAXf1dtLiGRZPaRwpOlm5rnscceEeZ+yi9PhyxQ9KGBPpvT7s6LBQh
         617A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=qWGxM8AcVbSstzS1YTcot+dFEQPX4lNxBkuhOR/NeDQ=;
        b=foicvRD1urF4j9hkW8KuYXwtCuoMicszN2l6jf36uakx+PodQ+SEOCUqonRdJ+sSxy
         gKwMFT/wLKR9ZzlLtO52PNM7LnvdDqqvPRtNQlnoR3KptNPYRwg+YxiPXO5VSnzZYldw
         cUfVxLaPmaCyEO1sCZwWGlcVjFbvqDiatlKC44JOpIAOx4v5Ld7Tqj3K+R5cCgFeCfHv
         QeTFy6Ds6ptV+7qcxF1NtAUYWkqfJkRsD8274rO5BB08BuvjrRupGEd62m5uOLFNGoYM
         YNpXAF88ctoYO4duxwhol93C91Etje6Yo6nnRQZNWWIi8ku4di5IAg1SPSNBmI9LiF9b
         8ROQ==
X-Gm-Message-State: AOAM530HEldeX5fcTMK5GhcUTWBD6rFZNBzWsOmw7ItOqLtMZZhaSARd
        TrGloXyCJLpRXy3BtT9dNjA=
X-Google-Smtp-Source: ABdhPJx+rx4cP+1+sOITxZuVG7Nz465Y7W657IpFhU6flcvdjD9M4Non/MytsCOr4x8QKpgyYWUM2w==
X-Received: by 2002:aca:2403:0:b0:325:6dae:a63b with SMTP id n3-20020aca2403000000b003256daea63bmr1586305oic.230.1652246873464;
        Tue, 10 May 2022 22:27:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bk14-20020a056820190e00b0035ec65ac944sm583358oob.16.2022.05.10.22.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 22:27:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3ccf7a2f-4690-5b85-21f1-21df69eb0a8d@roeck-us.net>
Date:   Tue, 10 May 2022 22:27:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Alexey Kardashevskiy <aik@ozlabs.ru>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Scott Cheloha <cheloha@linux.ibm.com>
Cc:     linux-watchdog@vger.kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, npiggin@gmail.com, vaishnavi@linux.ibm.com,
        wvoigt@us.ibm.com
References: <20220509174357.5448-1-cheloha@linux.ibm.com>
 <20220509174357.5448-3-cheloha@linux.ibm.com> <YnnPdv+Hh9UEHMu/@google.com>
 <052b9903-e405-f6d0-444c-24d22bb85ad4@roeck-us.net>
 <4f829857-5255-58d9-c3f4-7bc33980e4f6@ozlabs.ru>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC v2 2/2] watchdog: pseries-wdt: initial support for PAPR
 virtual watchdog timers
In-Reply-To: <4f829857-5255-58d9-c3f4-7bc33980e4f6@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/10/22 22:08, Alexey Kardashevskiy wrote:
> 
> 
> On 5/10/22 13:34, Guenter Roeck wrote:
>> On 5/9/22 19:35, Tzung-Bi Shih wrote:
>>> On Mon, May 09, 2022 at 12:43:57PM -0500, Scott Cheloha wrote:
>>>> +#define SETFIELD(_v, _b, _e)    \
>>>> +    (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
>>>> +#define GETFIELD(_v, _b, _e)    \
>>>> +    (((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
>>>
>>>> From `./scripts/checkpatch.pl --strict`:
>>> WARNING: please, no spaces at the start of a line
>>>
>>>> +#define PSERIES_WDTQL_MUST_STOP           1
>>>
>>>> From `./scripts/checkpatch.pl --strict`:
>>> WARNING: please, no space before tabs
>>>
>>>> +static const struct kernel_param_ops action_ops = { .set = action_set };
>>>> +module_param_cb(action, &action_ops, NULL, S_IRUGO);
>>>
>>>> From `./scripts/checkpatch.pl --strict`:
>>> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
>>> octal permissions '0444'.
>>>
>>>> +MODULE_PARM_DESC(action, "Action taken when watchdog expires: \"hard-poweroff\", \"hard-restart\", or \"dump-restart\" (default=\"hard-restart\")");
>>>
>>> The line exceeds 100 columns.
>>>
>>>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>>>> +module_param(nowayout, bool, S_IRUGO);
>>>
>>>> From `./scripts/checkpatch.pl --strict`:
>>> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
>>> octal permissions '0444'.
>>>
>>>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>>
>>>> From `./scripts/checkpatch.pl --strict`, the line exceeds 100 columns.
>>>
>>>> +#define WATCHDOG_TIMEOUT 60
>>>> +static unsigned int timeout = WATCHDOG_TIMEOUT;
>>>> +module_param(timeout, uint, S_IRUGO);
>>>
>>>> From `./scripts/checkpatch.pl --strict`:
>>> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
>>> octal permissions '0444'.
>>>
>>>> +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default=" __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
>>>
>>>> From `./scripts/checkpatch.pl --strict`, the line exceeds 100 columns.
>>>
>>>> +struct pseries_wdt {
>>>> +    struct watchdog_device wd;
>>>> +    unsigned long num;        /* NB: Watchdog numbers are 1-based */
>>>
>>> What does NB stand for?  Could it be removed from the comment?
>>>
>>
>> Latin "Nota Bene", for "This is important".
>> All comments should be important, so I agree, this has little
>> if any value.
>>
>>> Does `timer_id` or some other equivalent names make more sense for the
>>> variable?
>>>
>>>> +static int pseries_wdt_start(struct watchdog_device *wdd)
>>>> +{
>>> [...]
>>>> +    rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
>>>> +    if (rc != H_SUCCESS) {
>>>> +        dev_crit(dev, "H_WATCHDOG: %ld: failed to start timer %lu",
>>>> +             rc, pw->num);
>>>> +               return -EIO;
>>>
>>>> From `./scripts/checkpatch.pl --strict`:
>>> ERROR: code indent should use tabs where possible
>>> WARNING: please, no space before tabs
>>>
>>>> +static struct watchdog_info pseries_wdt_info = {
>>>> +    .identity = DRV_NAME,
>>>> +    .options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT \
>>>> +        | WDIOF_PRETIMEOUT,
>>>
>>>> From `./scripts/checkpatch.pl --strict`:
>>> WARNING: Avoid unnecessary line continuations
>>>
>>>> +static const struct watchdog_ops pseries_wdt_ops = {
>>>> +    .owner = THIS_MODULE,
>>>> +    .ping = pseries_wdt_start,
>>>
>>> Does this mean: it needs hard restart for every ping?
>>>
>>
>> If there is no separate ping function, there is no need to point
>> the ping function to the start function. The watchdog core uses
>> the start function automatically in this case.
>>
>>>> +static int pseries_wdt_probe(struct platform_device *pdev)
>>>> +{
>>> [...]
>>>> +    rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
>>>> +    if (rc != H_SUCCESS)
>>>> +        return (rc == H_FUNCTION) ? -ENODEV : -EIO;
>>>
>>> The parentheses can be dropped.
>>>
>>>> +    pw = devm_kzalloc(&pdev->dev, sizeof *pw, GFP_KERNEL);
>>>> +    if (pw == NULL)
>>>
>>>> From `./scripts/checkpatch.pl --strict`:
>>> CHECK: Comparison to NULL could be written "!pw"
>>>
>>>> +    pw->num = pdev->id + 1;        /* 0-based -> 1-based */
>>>
>>> Didn't see where the platform device was registered but using the pdev->id as
>>> the timer id could be unreliable (e.g. from auto increment).
>>
>> That is at the beginning of the patch, in arch/powerpc/platforms/pseries/setup.c,
>> which calls platform_device_register_simple() with an explicit device ID.
>>
>> I agree, though, that it is fragile: The code in the probe function
>> explicitly checks for a negative ID, which would only be provided if
>> platform_device_register() explicitly declares that (ie if it provides
>> PLATFORM_DEVID_NONE as device ID). But if that is a concern, there
>> might as well be code registering a platform device with
>> PLATFORM_DEVID_AUTO as device ID, and then th device id would be automatic
>> and more or less random. I think the instantiation code should be more
>> explicit: Either assume that PLATFORM_DEVID_NONE or PLATFORM_DEVID_AUTO
>> will never be used to register the watchdog devices, or provide other
>> information such as platform data to make it explicit.
>>
>> Also, the changes in arch code need to be made in separate patches.
> 
> 
> Often this is true but in case like this - the driver itself is dead code until the platform enables it and if there is a problem with the driver - bisect will point to the device enablement commit. Backporting becomes a problem as it is going to be 3 apart patches vs. one:
> 1) define hypercall
> 2) implement the driver
> 3) enable the driver + device FW feature flag.
> 
> Instead, either maintainer (powerpc or watchdog) says "ack" and the other one puts it in the tree, I saw this in practice. Thanks,
> 

I won't accept this. I don't mind giving an Ack to a patch applied elsewhere,
and I don't mind applying patches from another subsystem if Acked by affected
maintainers, but I strongly believe that there should be no cross-subsystem
patches. Also, I don't consider 2) and 3) to be a single logical change,
and the rule for patches is "one logical change per patch".

Other maintainers may handle this differently, but that is their call and
responsibility.

Guenter
