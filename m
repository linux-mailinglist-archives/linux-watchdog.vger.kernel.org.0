Return-Path: <linux-watchdog+bounces-1502-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4CA95A5BE
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2024 22:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DA741C2256D
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2024 20:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56A516F0E7;
	Wed, 21 Aug 2024 20:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="u2dX3f2s"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B068628DCB;
	Wed, 21 Aug 2024 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724271594; cv=none; b=KZ3cF113GnwIJHksLMeuvoX5lUQQSTycM8yNbtuu0vq5AUQGXjMv4BqypODsTjfQ0Z+vfJWLANXnDMko8218GwFrgr8nqYf+XwSTBMs5QqFuDWAhrjMZczDtgxHx88c5GokRLG6O8OV9QBOchvcA29kk58Z87T1bnajxID5vzmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724271594; c=relaxed/simple;
	bh=SP3rHwr1ywvF46shdk8T6gY/GsdqCuNVCznFqyobXo8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M5kAlmgxRkGgcIFvmVhYlXOlFuoX7eC4x8P7kiwnQGdzL/FszhoGNg8QTBXeAXmXYwFYYFsL5b9/lrrAjM3jn/EEhSxnqz2M+V1npXCe16BunCBcMdqEAtsWt3OqWrKhEUNaIC5gHKA/QqEsxLqAfuju9NWp0cG+D5UAtW9SCss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=u2dX3f2s; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47LKJcNr061306;
	Wed, 21 Aug 2024 15:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724271578;
	bh=JIMmagbu6rerDTIou13smHpQv0gTsnJDw5Ximb62oGI=;
	h=From:To:CC:Subject:Date;
	b=u2dX3f2srZf5JpIp1EZSf+TIM2v15csghHE2//VJdws2mjzPFvkIwcbUVX5aa8xh4
	 ya38W/gTgHin/lLgNNOI32OYcnI1YCW+o9B3gRamxDfiQVO6YlsryPz9tlbsF2firS
	 WTQaPliwmsX+1JUFMe29HRvYUioTQ8QWaY3cs4JI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47LKJcba013199
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Aug 2024 15:19:38 -0500
Received: from flwvowa01.ent.ti.com (10.64.41.90) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Aug 2024 15:19:38 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by flwvowa01.ent.ti.com
 (10.64.41.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Wed, 21 Aug
 2024 15:19:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Aug 2024 15:19:35 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47LKJZ62119523;
	Wed, 21 Aug 2024 15:19:35 -0500
From: Judith Mendez <jm@ti.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] watchdog: rti_wdt: Allow timeout config with timeout-sec
Date: Wed, 21 Aug 2024 15:19:35 -0500
Message-ID: <20240821201935.1698146-1-jm@ti.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Currently rti_wdt does not allow timeout to be configured
via DT property timeout-sec, so fix watchdog_init_timeout
to be able to use timeout-sec.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/watchdog/rti_wdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 8e1be7ba01039..7260c67e60a25 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -332,7 +332,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
 		memunmap(vaddr);
 	}
 
-	watchdog_init_timeout(wdd, heartbeat, dev);
+	wdd->timeout = heartbeat;
+	watchdog_init_timeout(wdd, 0, dev);
 
 	ret = watchdog_register_device(wdd);
 	if (ret) {

base-commit: 860bbe8e618fd62446309e286ab4a83d38201c0a
-- 
2.46.0


