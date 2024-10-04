Return-Path: <linux-watchdog+bounces-2082-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2937A991034
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AA3C1C239C9
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AAB1DDC06;
	Fri,  4 Oct 2024 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PfIfqBEd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EDE1ADFF4
	for <linux-watchdog@vger.kernel.org>; Fri,  4 Oct 2024 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072228; cv=none; b=iaTXNgygxXpIffhQ2NMFHVqR9ecyHq2lLYdNKHsXgcN3hDqXKylhlGj0xRYGiNdvm2Iu630zfqbZHKXv0uJoE2XeKI2A4Lj7HCJ2tXyYm3XSdwfvEcRn9H4pCbK5yxwqRvC3ednuu4/MNmCdCT2OMB8bizx6EJP03P3qOlv1D6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072228; c=relaxed/simple;
	bh=pC6VSE7Ezqb4qpzLlYhltXzbrzqA4rvvcj8dFsvAcvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXKpXa3y+K1OJFvzeedAsI4ahEZLay3dAioZ2RCv8QnBHv0izoUFVReR7TCoSAhrbOHAiAtg3bXTjyQz4fCg+P/O5Bp9wfaN6sieRmb9HJuK7M8Jk9kSU6ElfvXuNuI2HzckF626POqgXwhKjw1qD+djItpTYwSqv9RaxgknI5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PfIfqBEd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=7Cl0ml2N+Rtmf0IfKup4DEXUq9XLNUQAyEK4zAJaKug=; b=PfIfqB
	EdnBsELoUU4LJrkXuBH6yqAHtAbbfjGnnCnZakZmhmUFv8aWS0tJ/fAZ7z5V+IVq
	/ywwZnz/9KWv3+v9+Yb5ENFfq7BZ0AzxBB0Jz1LFmJbT8wi33wImSFayeCr0pOdt
	lGkSPd1boamjLEcFh8u/q085aS2WmpZssuSiX06NzHPgbcji5j50xkxG6BnYmFWY
	tn/3vPzJt9xEBvOkPk36bqajVOHSvaYHuW4pM59DszgYNuirt0yQ0EhJH1R5NiG7
	oEesMPVccMaIi58X7Tt/I+g2dEBqOFU7UGeTVDcm3I0pqogCYIATlSxoA7+hMB+G
	/9Aik9Y8Nj5wu/xw==
Received: (qmail 3546729 invoked from network); 4 Oct 2024 22:03:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 22:03:45 +0200
X-UD-Smtp-Session: l3s3148p1@+u8aK6wjPupQvCeD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [RFC PATCH 6/9] watchdog: octeon-wdt: don't print out if registering watchdog fails
Date: Fri,  4 Oct 2024 22:03:09 +0200
Message-ID: <20241004200314.5459-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core will do this already.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/octeon-wdt-main.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/octeon-wdt-main.c b/drivers/watchdog/octeon-wdt-main.c
index 52d49e4e35a0..0615bb816082 100644
--- a/drivers/watchdog/octeon-wdt-main.c
+++ b/drivers/watchdog/octeon-wdt-main.c
@@ -559,10 +559,8 @@ static int __init octeon_wdt_init(void)
 	watchdog_set_nowayout(&octeon_wdt, nowayout);
 
 	ret = watchdog_register_device(&octeon_wdt);
-	if (ret) {
-		pr_err("watchdog_register_device() failed: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	if (disable) {
 		pr_notice("disabled\n");
-- 
2.45.2


