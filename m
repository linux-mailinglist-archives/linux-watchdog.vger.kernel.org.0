Return-Path: <linux-watchdog+bounces-29-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B68207F417B
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Nov 2023 10:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55F38B20BB4
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Nov 2023 09:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2578C1CAA8;
	Wed, 22 Nov 2023 09:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="pLVyAniQ"
X-Original-To: linux-watchdog@vger.kernel.org
X-Greylist: delayed 1845 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Nov 2023 01:22:19 PST
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846509D;
	Wed, 22 Nov 2023 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JRXouuJfULJtmERrHhVMLHylo3BRns26iZLKV3W5G40=; b=pLVyAniQcBnvn7qvivjxA4sSYV
	/YYTATgl7fm7Tqt7TlQdsYOpxszP+cME/agLlQTffNWR8DCW4nhUrXNOnQOfhEL9C61g2NWtgb+3G
	kPEyIq7WNIpW9S+1YNwFBMntL5o6VeAXyhAOCbUI8f+Uo3/3IfuJGr8nDqHiJLELAqciS76quEAi8
	7RkaetF0MDOzhjl7dE3jsvWk4WyI2R3O8bBriuzWJa3brqN/NTAuTSIPyZ248t8tjtQYgxA12Y6zE
	J/Itz6u0Kp1PA8n+ai+8P5ICNFFI9kiKhvMO9kR30OwnC/WYrXst2Ya/zz7oZ+jzTQLYnPyi77q1Q
	3hahTfBg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1r5ix5-003hg5-ES; Wed, 22 Nov 2023 08:51:20 +0000
Received: from ben by rainbowdash with local (Exim 4.97)
	(envelope-from <ben@rainbowdash>)
	id 1r5ix6-00000000kDE-03Uz;
	Wed, 22 Nov 2023 08:51:20 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-watchdog@vger.kernel.org
Cc: linux@roeck-us.net,
	wim@linux-watchdog.org,
	samin.guo@starfivetech.com,
	xingyu.wu@starfivetech.com,
	linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] watchdog: starfive: add lock annotations to fix context imbalances
Date: Wed, 22 Nov 2023 08:51:18 +0000
Message-Id: <20231122085118.177589-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

Add the necessary __acquires() and __releases() to the functions
that take and release the wdt lock to avoid the following sparse
warnings:

drivers/watchdog/starfive-wdt.c:204:13: warning: context imbalance in 'starfive_wdt_unlock' - wrong count at exit
drivers/watchdog/starfive-wdt.c:212:9: warning: context imbalance in 'starfive_wdt_lock' - unexpected unlock

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/watchdog/starfive-wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index 5f501b41faf9..49b38ecc092d 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -202,12 +202,14 @@ static u32 starfive_wdt_ticks_to_sec(struct starfive_wdt *wdt, u32 ticks)
 
 /* Write unlock-key to unlock. Write other value to lock. */
 static void starfive_wdt_unlock(struct starfive_wdt *wdt)
+	__acquires(&wdt->lock)
 {
 	spin_lock(&wdt->lock);
 	writel(wdt->variant->unlock_key, wdt->base + wdt->variant->unlock);
 }
 
 static void starfive_wdt_lock(struct starfive_wdt *wdt)
+	__releases(&wdt->lock)
 {
 	writel(~wdt->variant->unlock_key, wdt->base + wdt->variant->unlock);
 	spin_unlock(&wdt->lock);
-- 
2.37.2.352.g3c44437643


