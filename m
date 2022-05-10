Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB308520C23
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 May 2022 05:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235579AbiEJDkr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 May 2022 23:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234806AbiEJDkU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 May 2022 23:40:20 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAB02A153D
        for <linux-watchdog@vger.kernel.org>; Mon,  9 May 2022 20:34:30 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id y14-20020a9d460e000000b00605ee347da1so11405977ote.8
        for <linux-watchdog@vger.kernel.org>; Mon, 09 May 2022 20:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=2O+6ORXtQ1rE3bkyu0by1/dtdeF7ZnVpbD53h8NS3og=;
        b=lLE9XAu8hmSjSUr073u4nWsZyeJ5Lu/9U5HfpJW3QE7OiZEo3l/Up8MKO0VHiLKeei
         E3xIXpSeqvHwjxIzUMtoXyYSdKY142adtQiPSGp3Bozb0ZpE9q5ORALUahMz7/SGiHhM
         FEVpuWP+ybkbJdEXfllg3GvDXsKpogQABTA58u0lhLN69EJ1w3IAUfMp9aFVmyTtXyGW
         aNWbrJoISWCRDHLCtk1yYJbekfij1TEUUst076dsBsqIPDMuINhc6sbSAEQS2LKXRay3
         uMsVHQISnCmGVLbaTSj7ROsrZI+ZbwGP7gxwev5WXvj4Mrk9SF3UhfK6QPWVL58DndUs
         F0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=2O+6ORXtQ1rE3bkyu0by1/dtdeF7ZnVpbD53h8NS3og=;
        b=5a96SybwUuXNyPXBfqeyivk0y0HMrN4ITwPdG8gv6M9so4NxGTX0byWnA60O1RPtl5
         xGONCiDXnECmlS8e9n4j5l2bj13FAa+MM0PcCrR7eo+/zIcYc9QLbvMa4QjqDswdGVad
         2d0C6VdA4/UjvzsNenePz0vbh4gRIrceLXGdq3OA8Na3TYU3RXcQK0lOWN0Y9YDtwU8A
         udJRAvySp4e7TO/O4QhZJBEyfGPuEujRpbrD/eJKz6H5k9HMahsV6VTvN3JRNy77HR+A
         Hw49KjGm+vdxtFYrP2gn5eI7fv/FgXvSPYUXHRKaGZCpbB+EfXrrsD7UbfTMyiHjLXYD
         chiQ==
X-Gm-Message-State: AOAM533VMdfZvZ+Ip2iR58KqcAoYDGK8ImqUv8eObNk4K0BrMY7LGg7h
        ivd3l88yQSHsI5S0H0DNtvg=
X-Google-Smtp-Source: ABdhPJxMryiykP+Gz447iAPaGqEQ1Jf7MJG3dOqYdzQpk6ysFZokPIC+glktCdYMwhH1CRYxxpHLOg==
X-Received: by 2002:a05:6830:1af0:b0:605:63c0:3d6f with SMTP id c16-20020a0568301af000b0060563c03d6fmr6866482otd.5.1652153669762;
        Mon, 09 May 2022 20:34:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y23-20020a0568301d9700b006060322126esm5292584oti.62.2022.05.09.20.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 20:34:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <052b9903-e405-f6d0-444c-24d22bb85ad4@roeck-us.net>
Date:   Mon, 9 May 2022 20:34:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Tzung-Bi Shih <tzungbi@kernel.org>,
        Scott Cheloha <cheloha@linux.ibm.com>
Cc:     linux-watchdog@vger.kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, aik@ozlabs.ru, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com
References: <20220509174357.5448-1-cheloha@linux.ibm.com>
 <20220509174357.5448-3-cheloha@linux.ibm.com> <YnnPdv+Hh9UEHMu/@google.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC v2 2/2] watchdog: pseries-wdt: initial support for PAPR
 virtual watchdog timers
In-Reply-To: <YnnPdv+Hh9UEHMu/@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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

On 5/9/22 19:35, Tzung-Bi Shih wrote:
> On Mon, May 09, 2022 at 12:43:57PM -0500, Scott Cheloha wrote:
>> +#define SETFIELD(_v, _b, _e)	\
>> +    (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
>> +#define GETFIELD(_v, _b, _e)	\
>> +    (((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
> 
>>From `./scripts/checkpatch.pl --strict`:
> WARNING: please, no spaces at the start of a line
> 
>> +#define PSERIES_WDTQL_MUST_STOP       	1
> 
>>From `./scripts/checkpatch.pl --strict`:
> WARNING: please, no space before tabs
> 
>> +static const struct kernel_param_ops action_ops = { .set = action_set };
>> +module_param_cb(action, &action_ops, NULL, S_IRUGO);
> 
>>From `./scripts/checkpatch.pl --strict`:
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
> octal permissions '0444'.
> 
>> +MODULE_PARM_DESC(action, "Action taken when watchdog expires: \"hard-poweroff\", \"hard-restart\", or \"dump-restart\" (default=\"hard-restart\")");
> 
> The line exceeds 100 columns.
> 
>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>> +module_param(nowayout, bool, S_IRUGO);
> 
>>From `./scripts/checkpatch.pl --strict`:
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
> octal permissions '0444'.
> 
>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> 
>>From `./scripts/checkpatch.pl --strict`, the line exceeds 100 columns.
> 
>> +#define WATCHDOG_TIMEOUT 60
>> +static unsigned int timeout = WATCHDOG_TIMEOUT;
>> +module_param(timeout, uint, S_IRUGO);
> 
>>From `./scripts/checkpatch.pl --strict`:
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
> octal permissions '0444'.
> 
>> +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default=" __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
> 
>>From `./scripts/checkpatch.pl --strict`, the line exceeds 100 columns.
> 
>> +struct pseries_wdt {
>> +	struct watchdog_device wd;
>> +	unsigned long num;		/* NB: Watchdog numbers are 1-based */
> 
> What does NB stand for?  Could it be removed from the comment?
> 

Latin "Nota Bene", for "This is important".
All comments should be important, so I agree, this has little
if any value.

> Does `timer_id` or some other equivalent names make more sense for the
> variable?
> 
>> +static int pseries_wdt_start(struct watchdog_device *wdd)
>> +{
> [...]
>> +	rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
>> +	if (rc != H_SUCCESS) {
>> +		dev_crit(dev, "H_WATCHDOG: %ld: failed to start timer %lu",
>> +			 rc, pw->num);
>> +	       	return -EIO;
> 
>>From `./scripts/checkpatch.pl --strict`:
> ERROR: code indent should use tabs where possible
> WARNING: please, no space before tabs
> 
>> +static struct watchdog_info pseries_wdt_info = {
>> +	.identity = DRV_NAME,
>> +	.options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT \
>> +	    | WDIOF_PRETIMEOUT,
> 
>>From `./scripts/checkpatch.pl --strict`:
> WARNING: Avoid unnecessary line continuations
> 
>> +static const struct watchdog_ops pseries_wdt_ops = {
>> +	.owner = THIS_MODULE,
>> +	.ping = pseries_wdt_start,
> 
> Does this mean: it needs hard restart for every ping?
> 

If there is no separate ping function, there is no need to point
the ping function to the start function. The watchdog core uses
the start function automatically in this case.

>> +static int pseries_wdt_probe(struct platform_device *pdev)
>> +{
> [...]
>> +	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
>> +	if (rc != H_SUCCESS)
>> +		return (rc == H_FUNCTION) ? -ENODEV : -EIO;
> 
> The parentheses can be dropped.
> 
>> +	pw = devm_kzalloc(&pdev->dev, sizeof *pw, GFP_KERNEL);
>> +	if (pw == NULL)
> 
>>From `./scripts/checkpatch.pl --strict`:
> CHECK: Comparison to NULL could be written "!pw"
> 
>> +	pw->num = pdev->id + 1;		/* 0-based -> 1-based */
> 
> Didn't see where the platform device was registered but using the pdev->id as
> the timer id could be unreliable (e.g. from auto increment).

That is at the beginning of the patch, in arch/powerpc/platforms/pseries/setup.c,
which calls platform_device_register_simple() with an explicit device ID.

I agree, though, that it is fragile: The code in the probe function
explicitly checks for a negative ID, which would only be provided if
platform_device_register() explicitly declares that (ie if it provides
PLATFORM_DEVID_NONE as device ID). But if that is a concern, there
might as well be code registering a platform device with
PLATFORM_DEVID_AUTO as device ID, and then th device id would be automatic
and more or less random. I think the instantiation code should be more
explicit: Either assume that PLATFORM_DEVID_NONE or PLATFORM_DEVID_AUTO
will never be used to register the watchdog devices, or provide other
information such as platform data to make it explicit.

Also, the changes in arch code need to be made in separate patches.

Thanks,
Guenter
