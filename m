Return-Path: <linux-watchdog+bounces-3162-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF88A73A2C
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Mar 2025 18:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BA59188A9FC
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Mar 2025 17:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9BE183CA6;
	Thu, 27 Mar 2025 17:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKHy/9tQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8B0DDD3;
	Thu, 27 Mar 2025 17:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743095535; cv=none; b=asvpxRD5hggTCfKV0a2LCuU1YOiCIHM9Zji4ZVmQx4106K5bmPPX7wJviZO/2e9FOVdaK6AIaOrVGmgS+8QU8NnY1vgtwdplacP5qe74T6sokUEJbOwMVyldrBcM+zoW3wTwsJgNcdVosN2IZDXqK/XG6N9xjiAByEZ58c8YatI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743095535; c=relaxed/simple;
	bh=z+x6GOiCYUO9WeWlaEnR17peJA+ucADMPc1YaQ7EjVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+Hcw18mdKPPx3Cj+J0pYkY0bAuWsBXjS3RGyO+J6OmNtHlKLnHLCScaLapUPtZL5zI4HPhTu0qPVS80EyPuRmjPBXe7XN/P2prA7z7jV2AVNX1PNQW8UemAK7eBo9VXRSr+8S9tUzIKgSndaLBhiuAxElDoANXqzJnkF+oxBl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKHy/9tQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D432C4CEDD;
	Thu, 27 Mar 2025 17:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743095534;
	bh=z+x6GOiCYUO9WeWlaEnR17peJA+ucADMPc1YaQ7EjVY=;
	h=Date:From:To:Cc:Subject:From;
	b=XKHy/9tQeLQQFL23dUITE8IR/qAnIPAKs7YTUFba9LnnMWoDup2sXsMRAbYIonHhm
	 4Qst1cY04ukFOXNE3J5a1hf/HetIdXKlvBu2F6APxpGCkk4EcCP+Axz/6ozCkCuDWl
	 hangwdc9OlJ+JS94JIdpStsBR14H8jnBEg+YXzkcLWPEyVfuk7YItGxloUBkzXOfwf
	 zVPO6ENWllCwWOakC+9hMdVkp7X+5u0ccQ5M7IfYcZt7tJO14IPzHLW+Vt7fQfOWOt
	 mXXewwEa3PWx4FJXUESltUtlv3/zzaPlTyD56zhtXsONR7ZTD+CgiHI8elU4F/XtWb
	 3PwBcg9fj0tlQ==
Date: Thu, 27 Mar 2025 11:12:11 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lukasz Majczak <lma@chromium.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2][next] watchdog: cros-ec: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <Z-WG6_uhWsy_FCq3@kspp>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the `DEFINE_RAW_FLEX()` helper for on-stack definitions of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warning:

drivers/watchdog/cros_ec_wdt.c:29:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes v2:
 - Fix truncated line in changelog text. (Tzung-Bi)
 - Update variable name: s/buf/msg (Tzung-Bi)
 - Cast to structs instead of union. (Tzung-Bi)
 - Add RB tag.

v1:
 - Link: https://lore.kernel.org/linux-hardening/Z-SBITmMfwjocYwL@kspp/

 drivers/watchdog/cros_ec_wdt.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wdt.c
index 716c23f4388c..9ffe7f505645 100644
--- a/drivers/watchdog/cros_ec_wdt.c
+++ b/drivers/watchdog/cros_ec_wdt.c
@@ -25,26 +25,22 @@ static int cros_ec_wdt_send_cmd(struct cros_ec_device *cros_ec,
 				union cros_ec_wdt_data *arg)
 {
 	int ret;
-	struct {
-		struct cros_ec_command msg;
-		union cros_ec_wdt_data data;
-	} __packed buf = {
-		.msg = {
-			.version = 0,
-			.command = EC_CMD_HANG_DETECT,
-			.insize  = (arg->req.command == EC_HANG_DETECT_CMD_GET_STATUS) ?
-				   sizeof(struct ec_response_hang_detect) :
-				   0,
-			.outsize = sizeof(struct ec_params_hang_detect),
-		},
-		.data.req = arg->req
-	};
-
-	ret = cros_ec_cmd_xfer_status(cros_ec, &buf.msg);
+	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
+			sizeof(union cros_ec_wdt_data));
+
+	msg->version = 0;
+	msg->command = EC_CMD_HANG_DETECT;
+	msg->insize  = (arg->req.command == EC_HANG_DETECT_CMD_GET_STATUS) ?
+		   sizeof(struct ec_response_hang_detect) :
+		   0;
+	msg->outsize = sizeof(struct ec_params_hang_detect);
+	*(struct ec_params_hang_detect *)msg->data = arg->req;
+
+	ret = cros_ec_cmd_xfer_status(cros_ec, msg);
 	if (ret < 0)
 		return ret;
 
-	arg->resp = buf.data.resp;
+	arg->resp = *(struct ec_response_hang_detect *)msg->data;
 
 	return 0;
 }
-- 
2.43.0


