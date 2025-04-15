Return-Path: <linux-watchdog+bounces-3306-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7137DA8ABA4
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 00:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84B41442B6C
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Apr 2025 22:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3022C2598;
	Tue, 15 Apr 2025 22:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ud8tuavu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1062741BB;
	Tue, 15 Apr 2025 22:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744757574; cv=none; b=ABJ4ubI3SVMN5rm4L0FGVmd6qqas/oE74efovPEhrcWTfWP1ZbpTu6cKtAE7a1BtU1P2Blh5iGSzZXQCHR7pVfNE3u4QWrpo7WQHvjqzSz47KpRQ62Ip20RisTt/WbkGA9rYPKKjlr+ypHtZ8vnk3WMp+CsGMiqQ/cDclIJ7ivU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744757574; c=relaxed/simple;
	bh=kuSqfEVGYVmZXK7f8kqjwH2TPWhKl39nEQu4c4RZyXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LPhPDMpBJtD8P8XJj19/1Ioa3ZQb7piz/oEqnuJQkffhUxix9g/oXrFneGxedK2/DWhYmzdWG/I9o9uDicRlw4lmOjKuQiH+FKcjvnbCD+E3RWDjlPKVmtCDWHM4LRk/H5IEcVUNqzHOzSiC5sEocNmbaWBuVNMY1tqm7RuRR5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ud8tuavu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8520C4CEE7;
	Tue, 15 Apr 2025 22:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744757573;
	bh=kuSqfEVGYVmZXK7f8kqjwH2TPWhKl39nEQu4c4RZyXc=;
	h=From:To:Cc:Subject:Date:From;
	b=ud8tuavuENCvK/NK7Twd0ROx6XjwmMtHP/Ug7ZpTxCrVYFitDzg5mAIlfPDG7vtqH
	 qkRn33DCoW0WC6beZyAUdoLW5cmqAnefKPyrbrTsM7iVh+sDmewI8iDQ/jkMU3yzB2
	 vDPXt3pRHOpOn8zkFgMHDkVmTMfQvbb7wWiDNWAsyjNuPCpMXKTnUqFnXoBmGe8TsL
	 RYk7I76A1EBp63tdr9EsHffrBMTmMGPTAFKvtLTT01BB70Tvi8yl0A39scMZx9hvQJ
	 M9ROkhYDPnwEpLjjSnWTUmjdDByjhX9OVG8LNuM3sZM5m/RL5GLTDw6TTC2w/ltnIt
	 qojmF1scDCbfw==
From: Kees Cook <kees@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Kees Cook <kees@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	=?UTF-8?q?David=20M=C3=BCller?= <d.mueller@elsoft.ch>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] watchdog: exar: Shorten identity name to fit correctly
Date: Tue, 15 Apr 2025 15:52:49 -0700
Message-Id: <20250415225246.work.458-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526; i=kees@kernel.org; h=from:subject:message-id; bh=kuSqfEVGYVmZXK7f8kqjwH2TPWhKl39nEQu4c4RZyXc=; b=owGbwMvMwCVmps19z/KJym7G02pJDOn/HjtmfG9+eWOD4oT1raqqe6+Zs7JsW5l26N9fyxx79 os3uu6u7yhlYRDjYpAVU2QJsnOPc/F42x7uPlcRZg4rE8gQBi5OAZhIfiLD/5TEb3+MS+Zuujjb ec+x0MCzJ/l+s1h7h14ouj3ry7XuYH+Gv7IVH056fPF6mxAl6jmpa7Whx/3i1IZn552S9/5kY3M Q5wEA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The static initializer for struct watchdog_info::identity is too long
and gets initialized without a trailing NUL byte. Since the length
of "identity" is part of UAPI and tied to ioctls, just shorten
the name of the device. Avoids the warning seen with GCC 15's
-Wunterminated-string-initialization option:

drivers/watchdog/exar_wdt.c:224:27: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminated-string-initialization]
  224 |         .identity       = "Exar/MaxLinear XR28V38x Watchdog",
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 81126222bd3a ("watchdog: Exar/MaxLinear XR28V38x driver")
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
---
 drivers/watchdog/exar_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/exar_wdt.c b/drivers/watchdog/exar_wdt.c
index 7c61ff343271..c2e3bb08df89 100644
--- a/drivers/watchdog/exar_wdt.c
+++ b/drivers/watchdog/exar_wdt.c
@@ -221,7 +221,7 @@ static const struct watchdog_info exar_wdt_info = {
 	.options	= WDIOF_KEEPALIVEPING |
 			  WDIOF_SETTIMEOUT |
 			  WDIOF_MAGICCLOSE,
-	.identity	= "Exar/MaxLinear XR28V38x Watchdog",
+	.identity	= "Exar XR28V38x Watchdog",
 };
 
 static const struct watchdog_ops exar_wdt_ops = {
-- 
2.34.1


