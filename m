Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E155E4E6142
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Mar 2022 10:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346013AbiCXJrf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Mar 2022 05:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240369AbiCXJre (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Mar 2022 05:47:34 -0400
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1A856C0B
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Mar 2022 02:46:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.savoirfairelinux.com (Postfix) with ESMTP id B69949C0244
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Mar 2022 05:46:00 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
        by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id hdzY2Jwg9TYX for <linux-watchdog@vger.kernel.org>;
        Thu, 24 Mar 2022 05:46:00 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.savoirfairelinux.com (Postfix) with ESMTP id 1D2889C024D
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Mar 2022 05:46:00 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
        by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id zK5nUfXbqsXu for <linux-watchdog@vger.kernel.org>;
        Thu, 24 Mar 2022 05:46:00 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
        by mail.savoirfairelinux.com (Postfix) with ESMTP id 025349C0244
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Mar 2022 05:46:00 -0400 (EDT)
Date:   Thu, 24 Mar 2022 05:45:59 -0400 (EDT)
From:   =?utf-8?Q?K=C3=A9vin_L=27h=C3=B4pital?= 
        <kevin.lhopital@savoirfairelinux.com>
To:     linux-watchdog <linux-watchdog@vger.kernel.org>
Message-ID: <1614767851.393290.1648115159966.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <476496628.2157003.1646393809190.JavaMail.zimbra@savoirfairelinux.com>
References: <476496628.2157003.1646393809190.JavaMail.zimbra@savoirfairelinux.com>
Subject: Re: iTCO_wdt on Intel NUC11TNBi5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Mailer: Zimbra 8.8.15_GA_4203 (ZimbraWebClient - FF98 (Linux)/8.8.15_GA_4232)
Thread-Topic: iTCO_wdt on Intel NUC11TNBi5
Thread-Index: 49Nj1ctMZBzt5MqycMGVrUB4pmlEryTK4zTO
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

Following my previous email, I have finally reached to make the watchdog work by updating the bios.
I updated the bios to the 0062 version (https://www.intel.fr/content/www/fr/fr/download/19698/709584/bios-update-tntgl357.html).

Thanks,

Kévin L'hôpital 
Free Software Consultant | Rennes, Fr 
Savoir-faire Linux

----- Mail original -----
De: "Kévin L'hôpital" <kevin.lhopital@savoirfairelinux.com>
À: "linux-watchdog" <linux-watchdog@vger.kernel.org>
Envoyé: Vendredi 4 Mars 2022 12:36:49
Objet: iTCO_wdt on Intel NUC11TNBi5

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

