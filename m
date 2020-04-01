Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3C019B476
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Apr 2020 19:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732723AbgDARCQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Apr 2020 13:02:16 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36452 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732717AbgDARCQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Apr 2020 13:02:16 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 031H1uWo001438;
        Wed, 1 Apr 2020 12:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585760516;
        bh=tIPQqztfiZihK5VUVh3MvQYpWQeFXNG74Mpn2ahqY/U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=EDN83wE7CB+aRHQLMQM1+WpkWHNQc/irLpH2Nd/n8PadAGVi1Bm6YxITO+LtcKnit
         mDa4NlLAe3xxhC+0bI8fCvYP0fURJw+ZzGqUEK5QuJPhR7zorMItPAZ7d8KVtetVKy
         uOwrnN/QE1XA3Z+rxpRiV942UBlNSIPNPJUENMcw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 031H1uT7017807
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 1 Apr 2020 12:01:56 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 1 Apr
 2020 12:01:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 1 Apr 2020 12:01:55 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 031H1rni000525;
        Wed, 1 Apr 2020 12:01:54 -0500
Subject: Re: [PATCHv3 3/4] watchdog: Add K3 RTI watchdog support
To:     Guenter Roeck <linux@roeck-us.net>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <aed89814-a78b-4a59-7673-bce5de34022d@roeck-us.net>
 <20200304104214.8625-1-t-kristo@ti.com> <20200304220648.GA31640@roeck-us.net>
 <ac261582-a101-c7c7-66e4-4ef20d037c7d@ti.com>
 <422f7335-9774-9ec1-6b0f-f22f811746cf@roeck-us.net>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <7e15714e-efed-56ae-7ca7-fbfac031326c@ti.com>
Date:   Wed, 1 Apr 2020 20:01:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <422f7335-9774-9ec1-6b0f-f22f811746cf@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 01/04/2020 18:55, Guenter Roeck wrote:
> On 4/1/20 5:44 AM, Tero Kristo wrote:
>> On 05/03/2020 00:06, Guenter Roeck wrote:
>>> On Wed, Mar 04, 2020 at 12:42:14PM +0200, Tero Kristo wrote:
>>>> Texas Instruments K3 SoCs contain an RTI (Real Time Interrupt) module
>>>> which can be used as a watchdog. This IP provides a support for
>>>> windowed watchdog mode, in which the watchdog must be petted within
>>>> a certain time window. If it is petted either too soon, or too late,
>>>> a watchdog error will be triggered.
>>>>
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Whats the plan for merging this one + the DT binding doc? I can't see this in linux-next yet at least, I do see the watchdog core change from this series though.
>>
> 
> It is in my watchdog-next branch at
> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git.
> 
> Wim usually picks it up from there.
> 
> The core patch didn't depend on DT approval, so I (and Wim) picked it up
> earlier.

Ok thanks for clarification, I thought there was something like that 
going in the background but decided to double check.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
