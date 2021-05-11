Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9405379DF2
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 05:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhEKDxi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 May 2021 23:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhEKDxi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 May 2021 23:53:38 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBA9C061574
        for <linux-watchdog@vger.kernel.org>; Mon, 10 May 2021 20:52:32 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id v22so12953276oic.2
        for <linux-watchdog@vger.kernel.org>; Mon, 10 May 2021 20:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s7lHc0VdoZ20ZRDRLVaIcxrXvLVWrq9IlImVOgY9Wes=;
        b=XP7ZDi25OppWERAsDOj3uGrc8nfFsVY+y0T2mhV8YAu6qkkKKaIF0YGrUxl0n7Yyv5
         21pWAmSEO6JbFeY0vAj8CfVbj2kaPlrTu06qEa6F7xEdF91q8lQN8mAuw9mh7MsN+mFl
         zkpEtzRCK7BDCroR0VVYsrpKxTYLc+giENEAFypRsDnUXG5wJTvnYxzHL8fjmTwv6cOL
         2gGjA/mRHwYBE62/3/eJ9Zou6rrOP5T5xgfQvkbrHtFVRpHBzhns+evza87UYxosc8pY
         LacCtVCoRgkjSl3brRAa5T9jQ20sBD6gP8TOwRIbcCc/yfVzaNj0I7C/mEfqeiMUET4Y
         8MLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s7lHc0VdoZ20ZRDRLVaIcxrXvLVWrq9IlImVOgY9Wes=;
        b=CEEyWSGfDNN/PJTgq2M92nN7dqODLEsTCbveHDcF0cyH7CWhH1T6pZUDsEpXFZyBPm
         hcLv1LwZx83v13mQT5pMeTspGS7iGwRxLuHzgwSnnKDEjm4+QMU0d3owFIcPlT1VHWmz
         FBzHKpyXNuEic02T+w4xckiH2aQ+k4S7brEBMkh5ysb6wa9o37Bac/ATWB3XbQoMIk56
         NkI/T7w4Ef+uP1KS9I0wigQ30ybOZvZO6bbEeOzw9L5P3ENBbLg2ULwtu3cfdLfGHDZr
         ArSAImNEDWrzD/hj+ewNh2KvubQY/OMoiPpDqloVlgoyCIk2V5YpaeDKArpjELAekTHE
         saaA==
X-Gm-Message-State: AOAM532LDlyxM3PwDmkyqIe0iD2e0U0IlQU6eBCwHDzlGln7ltX9yaug
        S40CoSZwrCzwpA4riwnxa3A=
X-Google-Smtp-Source: ABdhPJwXhdJKD26+/EH6HCyvs5tP/Kup43G//Hw9gqtaNmKffOPiKezK3cBRpKQhqgcDPu7i6i8YKg==
X-Received: by 2002:aca:c685:: with SMTP id w127mr1922201oif.89.1620705152372;
        Mon, 10 May 2021 20:52:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 88sm3532574otx.2.2021.05.10.20.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 20:52:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: sbsa: Support architecture version 1
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
        Al Stone <al.stone@linaro.org>,
        Jianchao Hu <hujianchao@hisilicon.com>,
        Huiqiang Wang <wanghuiqiang@huawei.com>
References: <1620618117-20135-1-git-send-email-zhangshaokun@hisilicon.com>
 <87833e5a-978a-aac5-fc4b-1a922864066b@roeck-us.net>
 <bf9e1b65-119b-d027-fc3d-8491cbc38cde@hisilicon.com>
 <669e1175-2eee-6c4b-8524-c672626022b6@roeck-us.net>
 <fb880396-4c30-78ff-2c1f-62ad4fef935f@hisilicon.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <65876276-ddd5-7e1c-c0e3-d94c316f2d93@roeck-us.net>
Date:   Mon, 10 May 2021 20:52:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <fb880396-4c30-78ff-2c1f-62ad4fef935f@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/10/21 7:49 PM, Shaokun Zhang wrote:
> Hi Guenter,
> 
> On 2021/5/10 21:16, Guenter Roeck wrote:
>> On 5/10/21 1:25 AM, Shaokun Zhang wrote:
>>> Hi Guenter,
>>>
>>> On 2021/5/10 12:25, Guenter Roeck wrote:
>>>> On 5/9/21 8:41 PM, Shaokun Zhang wrote:
>>>>> Arm Base System Architecture 1.0[1] has introduced watchdog
>>>>> revision 1 that increases the length the watchdog offset
>>>>
>>>> Is that how they call the watchdog count register ?
>>>>
>>>
>>> I think yes.
>>>
>>>> Also, doesn't that mean that the maximum timeout supported
>>>> by the hardware is now larger ?
>>>
>>> No, maximum timeout is the same. But the clock can be higher than
>>> before. For Armv8.6, The frequency of CNTFRQ_EL0 is standardized to
>>> a frequency of 1GHz which will set gwdt->clk. If the timeout is
>>> greater than 4(second), the 32-bit counter(WOR) is not enough.
>>>
>>
>> The maximuma timeout is limited with
>>
>> wdd->max_hw_heartbeat_ms = U32_MAX / gwdt->clk * 1000;
>>> You did not update that calculation. That means that the maximuma
>> timeout is still U32_MAX / gwdt->clk * 1000, which still fits
>> into 32 bit.
> 
> Correct, I will fix this in next version.
> 
>>
>> Please correct me if I am missing something.
>>
> 
> My bad, you are right. The maximum timeout shall be
> 0xFFFF.FFFF.FFFF / 1000.000.000(1GHz) which is larger than before
> 0xFFFF.FFFF / 100.000.000(100MHz) by the hardware.
> 
> Can I do like this, after the version is got and check the version?
>          sbsa_gwdt_set_timeout(wdd, wdd->timeout);
> +       sbsa_gwdt_get_version(wdd);
> +       if (wdd->version > 0)
> +               wdd->max_hw_heartbeat_ms = GENMASK_ULL(47, 0) / gwdt->clk * 1000;
> 

I would suggest to set max_hw_heartbeat_ms in one place
to avoid confusion. Either check the version earlier,
or move setting both max_hw_heartbeat_ms values
after the call to sbsa_gwdt_get_version().

Thanks,
Guenter

