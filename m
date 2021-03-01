Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF5D329465
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Mar 2021 23:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244172AbhCAWAx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 1 Mar 2021 17:00:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbhCAV7G (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 1 Mar 2021 16:59:06 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A489C061756
        for <linux-watchdog@vger.kernel.org>; Mon,  1 Mar 2021 13:58:25 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 49C362BA;
        Mon,  1 Mar 2021 21:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 49C362BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614635739; bh=OfriL43I/FwmwVb3uQPXnRG9xFY9LoznRzEmiYC8tMg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CvSPUUJVYgY/+qPdTaB3tx8lkVnHitIDeiZXaEGW5tURmiJTW2o1ty9M+Ogha9YYC
         Ph+FMoW/Ly2s/MZ/dumH7UdnfPH4NZLd68YnjWDQKWHwFO0x+TmPEXJ+37IFtCUMgi
         RSDkreur3ElAJdf3OS9L/ZfinmHwtFdRVrzEz6Qf0ui+kWDDGtcigMEZo8Z3eRR/mP
         iqzC1KV/5AMpTHJsjgxTTa+TAfXglhinB9QkWEQi7TfErk9u4GGThgLMVKerPGu7Gs
         UPTQx559heVG+A3cP0bAiKA4wm5CVVw7tcIFCw19ZE6GKimkyPCDmSCa2NhfPzrufH
         T1X3Io/KCy5OQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Flavio Suligoi <f.suligoi@asem.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH] docs: watchdog: fix obsolete include file reference in
 pcwd
In-Reply-To: <20210223111324.309285-1-f.suligoi@asem.it>
References: <20210223111324.309285-1-f.suligoi@asem.it>
Date:   Mon, 01 Mar 2021 14:55:38 -0700
Message-ID: <87h7lu35et.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Flavio Suligoi <f.suligoi@asem.it> writes:

> The file linux/pcwd.h is not more present in the kernel
> sources. Its information is now moved into the file:
>
> include/uapi/linux/watchdog.h
>
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  Documentation/watchdog/pcwd-watchdog.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

jon
