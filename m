Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCEF210DFE
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jul 2020 16:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731510AbgGAOsb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Jul 2020 10:48:31 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35710 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgGAOsa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Jul 2020 10:48:30 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 061EaSG0075681;
        Wed, 1 Jul 2020 09:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593614188;
        bh=HXEl6HBvdBsKDUGBfUdgQEY4qT6CI4rtQbIO4/KXAPk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=S26mXcSQ4V0OEILlv4buTP+1pgEKq8vr/X5icZ/l8OWB+or/FwwVsoT3hVovYR6t8
         eFdkfVk5nMEK8xBDC5d9muPjscz9A/qzJKYCgRiYcypr80Qc73RjXVwndBHBXdZLzF
         AZLcmfPU2tAAxRitVilEH05zAkmE6iGUZABe0YOs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 061EaSPC036063
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 1 Jul 2020 09:36:28 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 1 Jul
 2020 09:36:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 1 Jul 2020 09:36:28 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 061EaOFB060819;
        Wed, 1 Jul 2020 09:36:26 -0500
Subject: Re: [PATCH 2/2] watchdog: rti: tweak min_hw_heartbeat_ms to match
 initial allowed window
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Jan Kiszka <jan.kiszka@siemens.com>, <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200624114534.1362-1-t-kristo@ti.com>
 <20200624114534.1362-3-t-kristo@ti.com>
 <289c6104-a885-d3c1-c670-a081ebaaf782@siemens.com>
 <b3849bea-2a4d-079e-e9df-8a1d6c13c0c7@ti.com>
 <25bf3ed1-5434-9b45-20ae-e1b2cfc5e5c0@roeck-us.net>
 <1d84e633-b808-d6ac-a34c-9cc4709e43f6@ti.com>
 <20200630202356.GA16412@roeck-us.net>
 <4e9c2731-bf02-1b59-298b-b7f9a0e87d10@ti.com>
 <f9ab8206-a3a2-ec6e-2c7b-92e369c0996a@roeck-us.net>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <24c1c3d3-3ab9-46a5-3eef-ad375aaa8f41@ti.com>
Date:   Wed, 1 Jul 2020 17:36:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f9ab8206-a3a2-ec6e-2c7b-92e369c0996a@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 01/07/2020 16:34, Guenter Roeck wrote:
> On 6/30/20 10:50 PM, Tero Kristo wrote:
> [ ... ]
> 
>> Hardware supports changing the timeout value, however it only updates this during the next window (preload values are picked once user pings the watchdog.)
>>
> The current driver doesn't support or use that, though, since the start
> function is only called once to start the watchdog, and not at all if
> the watchdog is already running. So, if the bootloader sets the timeout
> to X, and the user sets a timeout of, say, X * 4, userspace will never
> ping the watchdog often enough. The driver will have to address that
> to support already-running watchdogs.

Yeah, I will modify that. I think I will just prevent changing the 
timeout if watchdog has been enabled from boot, it is probably cleanest 
approach. Unless I happen to come up with some sane way to change it on fly.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
