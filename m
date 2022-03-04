Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2414CD396
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Mar 2022 12:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiCDLhi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Mar 2022 06:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235309AbiCDLhi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Mar 2022 06:37:38 -0500
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D34C1B1DD2
        for <linux-watchdog@vger.kernel.org>; Fri,  4 Mar 2022 03:36:50 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by mail.savoirfairelinux.com (Postfix) with ESMTP id A5A979C0194
        for <linux-watchdog@vger.kernel.org>; Fri,  4 Mar 2022 06:36:49 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
        by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id OuQ9QFtP8ZZ9 for <linux-watchdog@vger.kernel.org>;
        Fri,  4 Mar 2022 06:36:49 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.savoirfairelinux.com (Postfix) with ESMTP id 500719C01D0
        for <linux-watchdog@vger.kernel.org>; Fri,  4 Mar 2022 06:36:49 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
        by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id YIn_36TKUkvD for <linux-watchdog@vger.kernel.org>;
        Fri,  4 Mar 2022 06:36:49 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
        by mail.savoirfairelinux.com (Postfix) with ESMTP id 361BA9C0194
        for <linux-watchdog@vger.kernel.org>; Fri,  4 Mar 2022 06:36:49 -0500 (EST)
Date:   Fri, 4 Mar 2022 06:36:49 -0500 (EST)
From:   =?utf-8?Q?K=C3=A9vin_L=27h=C3=B4pital?= 
        <kevin.lhopital@savoirfairelinux.com>
To:     linux-watchdog <linux-watchdog@vger.kernel.org>
Message-ID: <476496628.2157003.1646393809190.JavaMail.zimbra@savoirfairelinux.com>
Subject: iTCO_wdt on Intel NUC11TNBi5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Mailer: Zimbra 8.8.15_GA_4180 (ZimbraWebClient - FF97 (Linux)/8.8.15_GA_4177)
Thread-Index: 49Nj1ctMZBzt5MqycMGVrUB4pmlErw==
Thread-Topic: iTCO_wdt on Intel NUC11TNBi5
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello, 
I am currently working on creating a custom Linux distribution for an Intel NUC11TNBi5 on a 5.15.26 kernel version. 

I have some problem to make the watchdog work. 
The iTCO_wdt driver is well initializing and creating a watchdog device in dev directory: 

       iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=6, TCOBASE=0x0400) 
       iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0) 

When forcing the watchdog open (cat >> /dev/watchdog), the timeleft value isn't decreasing and a reboot never happened. No reboot also when forcing a kernel panic. 
I have also tried a Fedora 35 distribution as well as a Ubuntu 20.04, with the same result. 

Has anyone encountered this issue before? 
Is the Intel NUC11TNBi5 watchdog supported by the iTCO_wdt driver? 

Thanks, 

Kévin L'hôpital 
Free Software Consultant | Rennes, Fr 
Savoir-faire Linux 
Jami: klhopital 

