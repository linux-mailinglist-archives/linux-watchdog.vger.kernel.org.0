Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB79378F56
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 May 2021 15:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237353AbhEJNnV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 May 2021 09:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240405AbhEJNRo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 May 2021 09:17:44 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6C5C06138D
        for <linux-watchdog@vger.kernel.org>; Mon, 10 May 2021 06:16:22 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id d21so15707910oic.11
        for <linux-watchdog@vger.kernel.org>; Mon, 10 May 2021 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zYlkllCHA8MEYno0PceJLqwYYdjDIXNC8s32eZt7T44=;
        b=opIo0fj/1cjiUXILCSSNZ1dSsTJYb8ZYzw4Ekjs5iyi7UrlYq7Q1+p6wW+A30ZVENp
         2MBoav+NtfhbXxb9h+wjZNCkV8Rfiv3f/2cRAsYfiJSFOs7N8lwoPDSErtnQQEsqkBN6
         R4rsyJoQcS0xVitxLYKqvuRAXBiyGpW9RqRk7AuMSjvYfXV+YMhcJcbrIPJDSamuwh8X
         OTv8IMva9PfFBlgsmXEXpRGjPzj1RfPY9FuYK7mPB2q/vzy4bTsxppgjh9GW/4TEQJNW
         XCOfxqs21VxzB0v1ox1JPg2lEcfEhrUHQWUULH7QzItEk9lfPXuEWstp3AWWBuw14irR
         8/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zYlkllCHA8MEYno0PceJLqwYYdjDIXNC8s32eZt7T44=;
        b=TqxWXeTTwqWrOZDUYhbZTLprVr+TxDboCPcfoYsyj7dMxPWYH7hueWQqWRMHZtpvIb
         XF2uDA1BPfzm4BWcWO6oDel+7HSQpLu/k6Q8l800s0asXa4FpEiZmvlYdDD40ek/mWoC
         ZEGhV17aDLA0kRWsZxnrthprZE+FTUxNYv/HF+Z1uupjuPH6rOExZGaYzRJ+vpjPoy8k
         LAJelzuRAWW9Of6Iq3FEVvYeqk4uwIY/NQ7WeFKHDKOyvsWP6dN0o+cQTBR6Q0YgA1CI
         IWYPfivSvlzqA0Sp/8Dr6Rhs69hMBZaWvlr617BFtDONaVYN/3kiKcLE1MDNhcurMgzz
         PpfA==
X-Gm-Message-State: AOAM532l1LsalwT63d6g4YgZ2PcKYfOjMwDpjCcb2p9k2bw9mYGR0FCW
        yruupfmtRRmGaVPqNEyTx/likZPTrk8=
X-Google-Smtp-Source: ABdhPJwAI5838VLB0bxysigDJMc5ieSZb9okSh+XgEC2H6wFhW3MgMtsDVNWyXBi4bJSSyZWzVh6uw==
X-Received: by 2002:aca:c109:: with SMTP id r9mr25236323oif.83.1620652582201;
        Mon, 10 May 2021 06:16:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r72sm2584184oie.20.2021.05.10.06.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 06:16:21 -0700 (PDT)
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
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <669e1175-2eee-6c4b-8524-c672626022b6@roeck-us.net>
Date:   Mon, 10 May 2021 06:16:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bf9e1b65-119b-d027-fc3d-8491cbc38cde@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/10/21 1:25 AM, Shaokun Zhang wrote:
> Hi Guenter,
> 
> On 2021/5/10 12:25, Guenter Roeck wrote:
>> On 5/9/21 8:41 PM, Shaokun Zhang wrote:
>>> Arm Base System Architecture 1.0[1] has introduced watchdog
>>> revision 1 that increases the length the watchdog offset
>>
>> Is that how they call the watchdog count register ?
>>
> 
> I think yes.
> 
>> Also, doesn't that mean that the maximum timeout supported
>> by the hardware is now larger ?
> 
> No, maximum timeout is the same. But the clock can be higher than
> before. For Armv8.6, The frequency of CNTFRQ_EL0 is standardized to
> a frequency of 1GHz which will set gwdt->clk. If the timeout is
> greater than 4(second), the 32-bit counter(WOR) is not enough.
> 

The maximuma timeout is limited with

wdd->max_hw_heartbeat_ms = U32_MAX / gwdt->clk * 1000;

You did not update that calculation. That means that the maximuma
timeout is still U32_MAX / gwdt->clk * 1000, which still fits
into 32 bit.

Please correct me if I am missing something.

Guenter
