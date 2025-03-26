Return-Path: <linux-watchdog+bounces-3155-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8737A72495
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 23:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFD5E7A34A9
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 22:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E6A25FA2D;
	Wed, 26 Mar 2025 22:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajWO2PEj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864571EA7F3;
	Wed, 26 Mar 2025 22:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743028517; cv=none; b=Z5F5lAlRjO6C/Wl4vU4rXliUxj+Z6Eos6DYkbaW/HJMTiwq5OBEejsezidGr044a7AxKrDRErgxdB3JiGOByePQw27Z8uz7xVloTEod1biPR/DQ8r6qTuIZMbAOFxGjepCbfEsSRVr4dJBGa00xow6gYQMU//Lv1RjtfXc5XzSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743028517; c=relaxed/simple;
	bh=h2/FjSfnO5tJCgplmMq/TCSw9ir41yrKi5nabwTvw6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n9Nqax1lKEQSDnZqxKeKXbnx6/VM0+nlJd1VSH/WZ9VIzhkOB3UB/YLGjcKbUaJTa8hjfPb9lBzMOX2JsHM7nK/eXAfu9EzgUAXL59Gi26iZy8QFWVg4/8XaU64alj2KWLVTKwdTfTON30/dyQ3KPYe+HRwoqYodAcmxET++KVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajWO2PEj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C09BC4CEE5;
	Wed, 26 Mar 2025 22:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743028516;
	bh=h2/FjSfnO5tJCgplmMq/TCSw9ir41yrKi5nabwTvw6Q=;
	h=Date:From:To:Cc:Subject:From;
	b=ajWO2PEjA+UzL2cs0zSXt+8Ca37WkTkpWlyFQy3H6smrpaUgoep2xYSKHtf4lc+Qd
	 yHGoPzFDjh72YQBJ/koHFDmosC6d4/7GdxYDsoh7GdqOJeMW7Gv7RAsXuyBA3L7x2m
	 L14j5r2v8KyOJdAY5INFNWQicXGtfZ41p037k1wdz1/DBPywFej1n3femDl7YfW6vi
	 BSR0wZQCCmhQKuu8E6GnpXpxbR1756sdUXlGtnF0kRXngmjmfETby33J4tai+WL8pg
	 bSk2UJQ+zJB9yfuden7W1h5+tCEpNT3BHdYeijBcBS2vbIJwyGmmG/l7Y0D0IC9RMD
	 0NmTdef4DtwwQ==
Date: Wed, 26 Mar 2025 16:35:13 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lukasz Majczak <lma@chromium.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] watchdog: cros-ec: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <Z-SBITmMfwjocYwL@kspp>
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

Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warning:

rivers/watchdog/cros_ec_wdt.c:29:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/watchdog/cros_ec_wdt.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wdt.c
index 716c23f4388c..f6dba17d1036 100644
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
+	DEFINE_RAW_FLEX(struct cros_ec_command, buf, data,
+			sizeof(union cros_ec_wdt_data));
+
+	buf->version = 0;
+	buf->command = EC_CMD_HANG_DETECT;
+	buf->insize  = (arg->req.command == EC_HANG_DETECT_CMD_GET_STATUS) ?
+		   sizeof(struct ec_response_hang_detect) :
+		   0;
+	buf->outsize = sizeof(struct ec_params_hang_detect);
+	((union cros_ec_wdt_data *)buf->data)->req = arg->req;
+
+	ret = cros_ec_cmd_xfer_status(cros_ec, buf);
 	if (ret < 0)
 		return ret;
 
-	arg->resp = buf.data.resp;
+	arg->resp = ((union cros_ec_wdt_data *)buf->data)->resp;
 
 	return 0;
 }
-- 
2.43.0


