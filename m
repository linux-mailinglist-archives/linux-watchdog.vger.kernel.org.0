Return-Path: <linux-watchdog+bounces-3990-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CB5B22852
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Aug 2025 15:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4A5B1882E68
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Aug 2025 13:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D25279346;
	Tue, 12 Aug 2025 13:20:38 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4002C19C546;
	Tue, 12 Aug 2025 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755004838; cv=none; b=LYw6zZ/u0Jhm7tCxBZ2A4ca0mp6yV6xdLGFJyCM+llEcfvuoJB+hDDA+kXtPfDNgWl7OvQprixStxx/f+ox1AzgvJOuIPqD8D1yllilyk6hxVbcY1KFk5dLMmOszcGFM1l5hPf+HlCfbl5QHayJIM0dQagHcA1yd7zQrO0koKfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755004838; c=relaxed/simple;
	bh=dKZeRbXDmDXyWaQzC5JavRNVD3OYwP4u3q81PEyl0tA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fN346rcWN4Ho1PupgnBwMq7xkjLAoivjZnDnAaQ7JozumCOFjhOqI+CsKaDoPUsxqlWnfQUMw9GudwdPXA2xNoRecXpnjkW1rbHeUSUzrlUu9L6zffnYUFmxDqAozsL2sPBCUujUKkeQtzq67YRS9FOmfePsMICV1VbnwgWLeZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1WbS5Yxdz9sSf;
	Tue, 12 Aug 2025 14:51:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iikEfDgg7jeb; Tue, 12 Aug 2025 14:51:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1WbS4ppkz9sSW;
	Tue, 12 Aug 2025 14:51:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FFCD8B764;
	Tue, 12 Aug 2025 14:51:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Vtjy13ysAxeu; Tue, 12 Aug 2025 14:51:32 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4277B8B763;
	Tue, 12 Aug 2025 14:51:32 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: mpc8xxx_wdt: Reload the watchdog timer when enabling the watchdog
Date: Tue, 12 Aug 2025 14:51:26 +0200
Message-ID: <7cfd025ca62fb501dff1f0f923091415a5bc663f.1755002982.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755003087; l=1306; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=dKZeRbXDmDXyWaQzC5JavRNVD3OYwP4u3q81PEyl0tA=; b=DHlc4najn4H0S8heYPb/zAXQoBhuXVwytdtt0/rZgWx85ANJqqu396NbX9HuLosa5Kmauvvlc Aok+4K7ILhvCCtwuBRNhhfDkYALoJmHH8/zyAan4/WS7+aBD4SsGJ6X
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

When the watchdog gets enabled with this driver, it leaves enough time
for the core watchdog subsystem to start pinging it. But when the
watchdog is already started by hardware or by the boot loader, little
time remains before it fires and it happens that the core watchdog
subsystem doesn't have time to start pinging it.

Until commit 19ce9490aa84 ("watchdog: mpc8xxx: use the core worker
function") pinging was managed by the driver itself and the watchdog
was immediately pinged by setting the timer expiry to 0.

So restore similar behaviour by pinging it when enabling it so that
if it was already enabled the watchdog timer counter is reloaded.

Fixes: 19ce9490aa84 ("watchdog: mpc8xxx: use the core worker function")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/watchdog/mpc8xxx_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/mpc8xxx_wdt.c b/drivers/watchdog/mpc8xxx_wdt.c
index 867f9f3113797..a4b497ecfa205 100644
--- a/drivers/watchdog/mpc8xxx_wdt.c
+++ b/drivers/watchdog/mpc8xxx_wdt.c
@@ -100,6 +100,8 @@ static int mpc8xxx_wdt_start(struct watchdog_device *w)
 	ddata->swtc = tmp >> 16;
 	set_bit(WDOG_HW_RUNNING, &ddata->wdd.status);
 
+	mpc8xxx_wdt_keepalive(ddata);
+
 	return 0;
 }
 
-- 
2.49.0


