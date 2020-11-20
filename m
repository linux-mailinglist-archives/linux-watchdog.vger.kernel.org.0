Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3352BB354
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Nov 2020 19:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730728AbgKTScq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Nov 2020 13:32:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:51654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730203AbgKTScq (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Nov 2020 13:32:46 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC9C824137;
        Fri, 20 Nov 2020 18:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897165;
        bh=j2JkEuGygLEmtMTKa+2V2qD8l4tSbuHOQqZRQHZu7Uc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J31NoCotr84orBHXXuf9kpLMSW/5PgBMsTDrqV/lw8Jc5cASLd3Q/R630UrfsCJwb
         kawL08ar4z1iiLcHImRd5gpKp8Cx21xLVCu4+wNM+4jKRJRpctO6UQL50ZBVV84s0S
         VEDSgqls7JHFfwNJ5zD3XvBaO/bJZBotZDNX2IOM=
Date:   Fri, 20 Nov 2020 12:32:51 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 057/141] watchdog: Fix fall-through warnings for Clang
Message-ID: <713aa26be06d50dd3bb582a3cb71f04787ad5d5b.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a fallthrough pseudo-keyword instead of letting the
code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/watchdog/machzwd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/machzwd.c b/drivers/watchdog/machzwd.c
index 743377c5b173..73f2221f6222 100644
--- a/drivers/watchdog/machzwd.c
+++ b/drivers/watchdog/machzwd.c
@@ -174,6 +174,7 @@ static inline void zf_set_timer(unsigned short new, unsigned char n)
 		fallthrough;
 	case WD2:
 		zf_writeb(COUNTER_2, new > 0xff ? 0xff : new);
+		fallthrough;
 	default:
 		return;
 	}
-- 
2.27.0

