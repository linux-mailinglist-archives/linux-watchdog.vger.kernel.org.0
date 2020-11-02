Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 879232A23DF
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Nov 2020 06:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgKBFDj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Nov 2020 00:03:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgKBFDj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Nov 2020 00:03:39 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5467DC0617A6;
        Sun,  1 Nov 2020 21:03:37 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id w145so7844511oie.9;
        Sun, 01 Nov 2020 21:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5aaJnfExz9pdmi8XeTTVK9ZXYsecUuKvndt02/9PdGY=;
        b=K9qWYtg38SOW0pLMYYCJiBBe2yywrr0CBKzH9VEbxcI6N9Q9rpHZTAvtMFKWAwWxhy
         r9gDv6Y6PJp7GUMjMpPygrMONusnELWQHpoO47qzyeDWxQaf5WIHpPAllzmbratY7Bqb
         3J9EC9ogNyMU08msfRi5cBiFnVBWi1z0gtTtsYtYimp1BtZ11rFh/LXo3u5Bm+XxiIUu
         hpw7U7n3AaLg/4QZGwY3TZrB7qW5fNeFKVnIFNZZr98G+5e4KDA/8pVTphUULQ49lyvO
         0EdehKeB5TboK10TGFj8rpnC9kqKA9usFwkLoa+1jAPc595lRhf4cGYCxU6StcqM/BOB
         oynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5aaJnfExz9pdmi8XeTTVK9ZXYsecUuKvndt02/9PdGY=;
        b=IZ4hEsEZmBYmRN9QxwUv6QXO2qEoCqab6MkaQkND2is0SoPoD1iwdELZogCN/dNulL
         a6uADb1sW9s5X+ix/mYOHLyovd9KVC/bg8AZN4HloYEdCJmTXD9YeejCASHsVmDvAUYJ
         IPe6fRyaqFdNLhdPMaOKDiq+AGHOt7ie7PeVShPqv9/TYMTQQfVZVbxBM+kxwiDhafj7
         1AbATmKXX1tMO61RBonw/p5ed769yxSr3BZwGEigA2fBuQl4FrG1a+O6euhCU05ssrjt
         qdTDI41TRViM753ERuplKHy10pGz9KOLEnBVfZvHJ96akEzz+6F13UVfRcfrKsAZ5G0d
         uf0A==
X-Gm-Message-State: AOAM532PZZdcDsZA5WW0iZ0OEeSlQjC3lkL5MpwuL6LzqsdMl05eHkqN
        myfaW8RT/oBiiSAxZDLUEro=
X-Google-Smtp-Source: ABdhPJwJqi6/kPz8uhR1JywGVBdtVrO859481w6YsML63/hJx0IY+zl+z712UW4wFoPyoiQxgJu6Cw==
X-Received: by 2002:aca:4982:: with SMTP id w124mr4250879oia.71.1604293416737;
        Sun, 01 Nov 2020 21:03:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l9sm3423728otn.53.2020.11.01.21.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2020 21:03:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when
 appropriate
To:     Kathiravan T <kathirav@codeaurora.org>,
        Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        bjorn.andersson@linaro.org, wim@linux-watchdog.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
References: <20201031121115.542752-1-robert.marko@sartura.hr>
 <a71307f5-22b4-0d38-2880-96084bb07275@roeck-us.net>
 <23aea80f-265b-8a23-e8ea-f46639dd4129@codeaurora.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5b7def39-8c23-d30f-e2d3-bc38beee8919@roeck-us.net>
Date:   Sun, 1 Nov 2020 21:03:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <23aea80f-265b-8a23-e8ea-f46639dd4129@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/1/20 7:58 PM, Kathiravan T wrote:
> 
> On 10/31/2020 7:38 PM, Guenter Roeck wrote:
>> On 10/31/20 5:11 AM, Robert Marko wrote:
>>> If the watchdog hardware is enabled/running during boot, e.g.
>>> due to a boot loader configuring it, we must tell the
>>> watchdog framework about this fact so that it can ping the
>>> watchdog until userspace opens the device and takes over
>>> control.
>>>
>>> Do so using the WDOG_HW_RUNNING flag that exists for exactly
>>> that use-case.
>>>
>>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks for addressing the comments and now the patch looks good to me. One more suggestion, can we make the initcall level of the driver to subsys_initcall_sync so that the driver gets registered immediately after the watchdog_core is registered and watchdog_core starts pinging the WDT?
> 

That would mean to replace module_platform_driver(), which would be a whole
different discussion, is not widely needed, and would potentially interfere
with the subsys_initcall_sync() in the watchdog core. This will require
specific evidence that a problem is seen in the field, and that it is truly
needed. Plus, it would have to be a different patch (which you could submit
yourself, with evidence). Let's stick with one logical change per patch,
please.

Guenter
