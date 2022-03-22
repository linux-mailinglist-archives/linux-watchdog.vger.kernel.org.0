Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBB24E4343
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Mar 2022 16:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbiCVPoh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Mar 2022 11:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238636AbiCVPoh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Mar 2022 11:44:37 -0400
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com [192.185.143.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E798C7CB
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Mar 2022 08:43:09 -0700 (PDT)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id 15921653FB9
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Mar 2022 10:39:13 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id WgbInPzFo22u3WgbJnq7AX; Tue, 22 Mar 2022 10:39:13 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=x/RuycUSeoqaub47FUp+aDrwE3WWtaAtstNGrYVX9kM=; b=puJ5p+WIVIWD7qxyZLiry7Aea/
        HiwACV7XI9RCk7eqHCLrvqLlGKjca/sY/lA11+wvwU6oHkFHvVLqHooO5aSCv+pQwahln7yswQKAJ
        Gp+FHyRDXebu1fFL/uX3PiINSFxVrvIR9uZde+1Q0Og0dcrpRqBFYfI6KLUIxzdCLdmJQzh3qTsl1
        mWTUp9gMVlut7bl4ytBwm42Sd3oMkY6R4dus5TPpzf57r+76/Q1h4p+011Y6w9+ctZq5++ZKfcbag
        ZeGqTjzZR/kW9OYRA1GvQMGH0LweNVFHD539p3e5AsGIElRZWbkXZxRwi0sidREt9kmwpjO5kCRQn
        FBppgFwg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54398)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nWgbI-000fAV-JZ; Tue, 22 Mar 2022 15:39:12 +0000
Message-ID: <3cd1c742-64a2-2ebc-be51-2b3f9809adb8@roeck-us.net>
Date:   Tue, 22 Mar 2022 08:39:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     =?UTF-8?Q?Sondhau=c3=9f=2c_Jan?= <Jan.Sondhauss@wago.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <20220322083754.50322-1-jan.sondhauss@wago.com>
 <42d866cd-c781-5c2a-7f4f-c33cba954843@roeck-us.net>
 <c67f7608-1343-1f51-1554-d95abb17eaae@wago.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] drivers: watchdog: omap_wdt: ensure working trigger
 pattern
In-Reply-To: <c67f7608-1343-1f51-1554-d95abb17eaae@wago.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nWgbI-000fAV-JZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54398
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 8
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/22/22 08:23, Sondhauß, Jan wrote:
> 
> 
> On 22/03/2022 13:43, Guenter Roeck wrote:
>> On 3/22/22 01:38, Sondhauß, Jan wrote: > When the watchdog is
>> initialized and triggered before the kernel runs, > it must be ensured
>> that the kernel uses a different trigger pattern. > Otherwise the
>> watchdog cannot be kicked. > ZjQcmQRYFpfptBannerStart
>> This Message Is From an External Sender
>> Please use caution when clicking on links or opening attachments!
>> ZjQcmQRYFpfptBannerEnd
>>
>> On 3/22/22 01:38, Sondhauß, Jan wrote:
>>> When the watchdog is initialized and triggered before the kernel runs,
>>> it must be ensured that the kernel uses a different trigger pattern.
>>> Otherwise the watchdog cannot be kicked.
>>>
>>> Reading the current counter reload trigger pattern from the watchdog
>>> hardware during probing makes sure that the trigger pattern is different
>>> from the one previously used.
>>>
>>
>> It is kind of annoying that u-boot uses the same trigger pattern. Question
>> though: What happens if the register was not initialized by the ROM monitor
>> and contains the power-up value. Is the chip ok with using that as base ?
> 
> In the current implementation the value is negated before writing to the
> chip. After reset the register contains 0. In this case the driver would
> alternate between ~0 and 0.
>   From the technical reference manual (SPRUH73P): Writing a different
> value than the one already written in the Watchdog Trigger Register does
> a watchdog counter reload.
> 
> As far as I can tell it should work. But I just noticed a different
> problem with my patch: The access to the watchdog happens before the
> hardware is enabled via pm_runtime enable. So in the current state that
> could lead to an access violation..
> 
>>
>> If not it might be easier to just use some other pattern like 0xfeedface
>> or even some pseudo-random value.
> 
> The would be easier indeed. The idea behind reading out the current
> value is that maybe the driver could get copied from the kernel again.
> 
> What do you suggest as a V2 patch? What kind of testing should I
> provide? I only have a am335x soc at hand.
> 

I can see two possibilities:
- Use get_random_int() to initialize wdt_trgr_pattern
- Instead of using wdt_trgr_pattern, do something like
	writel_relaxed(~readl_relaxed(base + OMAP_WATCHDOG_TGR), (base + OMAP_WATCHDOG_TGR));

My personal preference would be to use get_random_int().

Thanks,
Guenter
