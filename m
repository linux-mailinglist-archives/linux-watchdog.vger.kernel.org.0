Return-Path: <linux-watchdog+bounces-38-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FBE7F8171
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Nov 2023 19:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8455A1C216B0
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Nov 2023 18:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DF1364A7;
	Fri, 24 Nov 2023 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eNqfbAea"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05502FC21;
	Fri, 24 Nov 2023 18:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31834C433C7;
	Fri, 24 Nov 2023 18:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700852320;
	bh=OitIkk/KczZ9zjgXU6gXEQ2EjaKX9udOFK3h89gF5YE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eNqfbAeag13st+486XDBof9rvnQy75hXQeJw/3dcHKTC4iIN2GqtH+r4q4dYshuU7
	 5IGDIdY6dkMwVK/RvyhqwzJlp605vE+l4swMAu5ht4p/hAor1dvKD+pe6QmKuONrb1
	 L8gTlPs4NZBgLI5tKqLo9Otjiqj2od5Rt/NSREEc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
	Darren Hart <darren@os.amperecomputing.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6.1 309/372] sbsa_gwdt: Calculate timeout with 64-bit math
Date: Fri, 24 Nov 2023 17:51:36 +0000
Message-ID: <20231124172020.703826908@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124172010.413667921@linuxfoundation.org>
References: <20231124172010.413667921@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Darren Hart <darren@os.amperecomputing.com>

commit 5d6aa89bba5bd6af2580f872b57f438dab883738 upstream.

Commit abd3ac7902fb ("watchdog: sbsa: Support architecture version 1")
introduced new timer math for watchdog revision 1 with the 48 bit offset
register.

The gwdt->clk and timeout are u32, but the argument being calculated is
u64. Without a cast, the compiler performs u32 operations, truncating
intermediate steps, resulting in incorrect values.

A watchdog revision 1 implementation with a gwdt->clk of 1GHz and a
timeout of 600s writes 3647256576 to the one shot watchdog instead of
300000000000, resulting in the watchdog firing in 3.6s instead of 600s.

Force u64 math by casting the first argument (gwdt->clk) as a u64. Make
the order of operations explicit with parenthesis.

Fixes: abd3ac7902fb ("watchdog: sbsa: Support architecture version 1")
Reported-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
Signed-off-by: Darren Hart <darren@os.amperecomputing.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: <stable@vger.kernel.org> # 5.14.x
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/7d1713c5ffab19b0f3de796d82df19e8b1f340de.1695286124.git.darren@os.amperecomputing.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/watchdog/sbsa_gwdt.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -153,14 +153,14 @@ static int sbsa_gwdt_set_timeout(struct
 	timeout = clamp_t(unsigned int, timeout, 1, wdd->max_hw_heartbeat_ms / 1000);
 
 	if (action)
-		sbsa_gwdt_reg_write(gwdt->clk * timeout, gwdt);
+		sbsa_gwdt_reg_write((u64)gwdt->clk * timeout, gwdt);
 	else
 		/*
 		 * In the single stage mode, The first signal (WS0) is ignored,
 		 * the timeout is (WOR * 2), so the WOR should be configured
 		 * to half value of timeout.
 		 */
-		sbsa_gwdt_reg_write(gwdt->clk / 2 * timeout, gwdt);
+		sbsa_gwdt_reg_write(((u64)gwdt->clk / 2) * timeout, gwdt);
 
 	return 0;
 }



