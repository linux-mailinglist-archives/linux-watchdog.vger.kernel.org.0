Return-Path: <linux-watchdog+bounces-4928-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF3gITrTjGm+tgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4928-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:06:34 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C712703A
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09E863018C14
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 19:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A77F352F9F;
	Wed, 11 Feb 2026 19:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFnWtSju"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE90352C20
	for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770836788; cv=none; b=A1P3Lf6B8dbiGFRNXLidmoGhIa45gufV9jRi+01kDox69VHUfuoIkS+HJ0hj9zKsiEFU9vvzOQWfFZiOL6uTI4ErmeFVWhiaF24YOYqv3aor/NCoozyfwTHptzJ+FLYhvriAr2lP/G6QuCXk/LEMYRtFTnzm5ndVSnVLbvXsCQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770836788; c=relaxed/simple;
	bh=cZY8vR0GYdG5iiJGYcGfS07opBc9v5yiMYhfDMtAwaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ubYwxmvZCvmbikxbHnF2kRl+hyCJppknlTx06BtbiautFVr+dGt/qj0L1rvwAYC88gpugw6zY+09pFAGLy/NCD6VVj/JsCuDE5Oks6el+FXwBk2lxC3OjEqC/JjWb+M1bNomfpi46XW8hMe/3Y2pAxpEkCyO30FrXiGHkVu8rwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFnWtSju; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so28316815e9.3
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 11:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836782; x=1771441582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1UoJesX+GyRcMVK+NyqzvpYJuioaZVcWp3DlX733fk=;
        b=ZFnWtSjuiOn5DarZnH6kvmnybYHJpbS+AFHHr1K9TFwDXv+2i+kh4RiLnNCS5bZgXQ
         EmdCa80gcpzC10IQTxN/XbRzTFtNZkmqoJEz846573PLXSDoWzdz1L0MBZal/5086bl1
         0MlIFlplhTFFPoK6RK+GiN/Lt+vWVv/HzSeSvpRJaLolupjJ3On4jjkGqyipHsZOHQ9d
         r3C6KUKTODReNTCW2qAo9wAs447ZfXjCt1kG09ixVpgdG/lN7x3umgapf4ROtKcbPKXv
         9d1EvbziGoCfMk3csXxRmOp12IPTVdSSzdwI9OwOgfpKBf2ltxAPdTJUhfFpL5yveZGt
         R6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836782; x=1771441582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v1UoJesX+GyRcMVK+NyqzvpYJuioaZVcWp3DlX733fk=;
        b=YD+GPPB77h0AxY+XAhF+mYR4uiFVBFitkg3HU9+Bw9VWBMe0Lv+JiPSBpZN4FyGruo
         ONs25vIA3qzZGt57Yr8PDp/jFuUIdIcSsnKa6+0t3nz6WdoM1mTtnCb3PFz4u590ahVm
         f/OpgcmeLHOTrG0mE3z4J/ri50cVbfJ1xofTtw2idN0Bk9McdFTzMcuF89Oq9ODCPWgH
         sx8WDGxRjptemWHT8K3etsNI3/e5Ut+EfMNGbKMNv4/H3vR3nd0QCpdpCr1X8TrkX44E
         8ob2SvM/FU1RbzdhB9eIGhdlyyYPE025PnrSQgFuRpLxjZDbDm6FbE96t22heT6zIbti
         QPOA==
X-Forwarded-Encrypted: i=1; AJvYcCWc5BtMXAQfJCHxGh3VtiqhDkl+D+tgBg/bOZz+V+k7lFm8o9HJDRSDDgpKix+MH9GPrRzI05A5iFXKS4F06w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdgfucsezK7sNz9WSrOsPx916laVaa4y3ms8GhqND1SgvxU4qE
	HKPsueKJLh8rQ16HL4+BlxO9lsbedX3B36Th39CGichbLShoONZiwksb
X-Gm-Gg: AZuq6aIBfrWf/ynqK9I6teefUiX8bMEAa52Lbck7+7p+43/X2Zx6aQwYVWgUkcLS6A9
	l6EBwZCW6v6ZJ2p0Vp7WTG+uQWQybuz4groKnIZI/QJC6tr6ewP1hrX+qmIaK4lxovZiuYY/BLr
	OpiHgTfhGx60xG5jpcZZkfnxxemttJfE2QoVEJiat60PxUdq/ajGiKqw6PAY4VAQ9FsxSpFvfxI
	gVuuxtN2l/PSZ+JkmU/c23+KUQtm+ppxfDcaT4Y02MHp4kjYNGCdyHHsfbF7WP0dfqGVhFseMbP
	8LZZLBCvzCUdctyUYgb83rGs05zPxOVKf52SHchEG4SYVuyO6xIouUvrOC/HRNM3qeS7cEEdxa2
	GfxnsxkDl2aKQnI6+df01Rwb0rGpgh6jWHNME3twTxx3uAXN7Hh2HqcekPKR7H406giGBhlLjnR
	fQ0EN6avGARxQZ0ca1cnQ=
X-Received: by 2002:a05:600c:138b:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-48365723e48mr2761705e9.36.1770836781584;
        Wed, 11 Feb 2026 11:06:21 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:21 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/7] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Wed, 11 Feb 2026 19:03:22 +0000
Message-ID: <0ab331c556d76ddfc7f287d6288c4f60f4ef90c8.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-4928-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-watchdog.org,roeck-us.net,kernel.org,collabora.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 041C712703A
X-Rspamd-Action: no action

The mt8167 SoC has 64 MMSYS resets, split in two contiguous 32-bits
registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144), as
also stated in the downstream kernel for the Lenovo Smart Clock
in the ddp_reg.h header.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 3 +++
 drivers/soc/mediatek/mtk-mmsys.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index eef14083c47b..2d20b21fb0ea 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -18,6 +18,9 @@
 #define MT8167_DSI0_SEL_IN_RDMA0			0x1
 #define MT8167_DSI0_SEL_IN_MASK				0x3
 
+#define MT8167_MMSYS_SW0_RST_B				0x140
+#define MT8167_MMSYS_SW1_RST_B				0x144
+
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index bb4639ca0b8c..03cbc393f978 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -57,6 +57,8 @@ static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.clk_driver = "clk-mt8167-mm",
 	.routes = mt8167_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
+	.sw0_rst_offset = MT8167_MMSYS_SW0_RST_B,
+	.num_resets = 64,
 };
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
-- 
2.43.0


