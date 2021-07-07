Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9298D3BE227
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jul 2021 06:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhGGElp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Jul 2021 00:41:45 -0400
Received: from cpanel.siel.si ([46.19.9.99]:46724 "EHLO cpanel.siel.si"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229883AbhGGElp (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Jul 2021 00:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=6ujUnLqYVCynnhI+PP3uiJWbFDf2nY0P6MhbNP8C19s=; b=GexH999c0uK0a0Tqjp3hMvHqNR
        NehVvVyu1Fot7mAW/HBhAoB3dXWAvPRMhxweECuf/lvB5OGtZ/T2tpfYu3GSEs5YxW6ApKxloyCFS
        u62VK6ISdEnSulwm7BpqAMvCzQ9FsV5tf96ezzdepGxqPX4BxQnT+inTblwv1RC2KwHT/8l/h9EjQ
        WGxskgPvmU7o9rKSA1lRzMtUxbYHo4EnwTwLMvLPccBBslzFkMWHJSDhSKMuESh9e/XeE/i7L9y0M
        s9SnU8jdBxtyjXR9hH2ez5jHrM6Z3QOxTnLg8vwg0lMLYlNlO0M34FrgN8Ho2bZC7pYLt6IYJY73C
        lnxp5SNw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:49926 helo=[192.168.69.116])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <primoz.fiser@norik.com>)
        id 1m0zKo-00F48f-OM; Wed, 07 Jul 2021 06:39:02 +0200
Subject: Re: [PATCH] watchdog: da9062: da9063: prevent watchdog pings ahead of
 reboot
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20210706112103.1687587-1-primoz.fiser@norik.com>
 <4fc1998d-ed3b-6934-9d05-62ac68659744@roeck-us.net>
From:   Primoz Fiser <primoz.fiser@norik.com>
Message-ID: <e223c8eb-848c-b79e-0568-0fb93c270d98@norik.com>
Date:   Wed, 7 Jul 2021 06:39:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4fc1998d-ed3b-6934-9d05-62ac68659744@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

I will re-spin boards in boot loop tests to see if your solution to the 
problem also works. If this is the case, that would significantly reduce 
code complexity, indeed.

On the other hand I fear that it might be too late to check for 
(system_state > SYSTEM_RUNNING) in watchdog ping handler since if I 
remember correctly reboot notifier still runs in system_state == 
SYSTEM_RUNNING which might be just enough sooner to hit the sweet spot.

But nevertheless, thank you for your input and the idea.

Keep you informed,

BR,
Primoz


On 6. 07. 21 15:28, Guenter Roeck wrote:
> Why all that complexity and not just check system_state here ?
> 
> Guenter
