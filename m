Return-Path: <linux-watchdog+bounces-4932-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE8gLBjUjGm+tgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4932-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:10:16 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E0127100
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D6AC3078364
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 19:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF06352C57;
	Wed, 11 Feb 2026 19:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfEI7SVR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832093542D8
	for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 19:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770836800; cv=none; b=owSzGyxV2SMxuHinWK+b8X58+jsKSMiKEI6v5hwA/ysf/u8DsgOF1FGypPR7fyB8kphOzYInRbsckiCxQMMuquAKG/XKiOuawea91624Ra16/qGcph6VApxbTu96rsBuMn8exSxA6SddLE7Lbb1EPCFcLm9TK+3MAJmdl9wbeXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770836800; c=relaxed/simple;
	bh=a4J/xWsDpMNpjLmFU5z04H5fzhBb2YVN235yoGzf9tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5ZGk03GsWXS811cf8Qernx774cZttkWv8TPxnpbPooS53VV1OU19NHm+0qFT0YyQ42d9Q6HpblJtUA2d+N1jaJn1+fP3+f11+oZ6LCW2y+1+R5iIlhyhxjvmnHrepbEeHWs0KTTzka1OUt8f0AkvCLoRveV2KulYj62P4KR62M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfEI7SVR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4359249bbacso896275f8f.0
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 11:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836797; x=1771441597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdmckHOXykZv4Q2iSO3Y/ko+Sekk6KZzLLdXZC1M56k=;
        b=KfEI7SVRs4uK6U0Yrkwd/1F+XiDCtw8SpWnDufoLFbPQCfz9tzyKULg7p4xxmk6x8i
         O7RRYqZ4PeaGwV5A9OvYTE37vdW2hMBahz+O+hY6pEMdKKVLgDmQ7E2oWRN+8iOf81va
         lzy/M2xopDytLIMymzBgc2QyfOV/XyvwJ5APVFjCYg9SN/6BPX99CJBZo907H1l2SiRr
         6hmLXkqRe1GY6tr83YRc8ONwy150MS/P8rTBr5aguMLXD7j77tIkih/RV0XOeqx2P7GH
         vLfT/pqVfxVTElUClXokv50CbYbRgdI9YhIlyl3mBOE+dtwPXU7jQqoX3JWJwJkfkw9/
         B2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836797; x=1771441597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hdmckHOXykZv4Q2iSO3Y/ko+Sekk6KZzLLdXZC1M56k=;
        b=RsBM7fXrf+6ml8ChClG5zYXqREaMVp+VqYAOOHsIhX7ajM3wXuM7CJSz9QQGkRjmru
         Z88IYx+3RKcJ+RZBvkyfD+erEnHIv1RumRcJSmVKRDzUpDy77oij/zF3M3osW9eGH/0V
         ue6uV1MLElIjCehy4mjdzDIqmZLlZexOnZHHA31Mr9Fabv0lSPIF2Y7B3I4hdzKRQ53G
         YUrQc9XDnd/od8/JjpWHW3nOA740UKmwQiGgin2iCQQvtjaUOPTXTRU/am2PZh2jBi1p
         WgGtezBej+EeoeMmpE8AWipFWeiXpGay5ftxENWiQEKWuBJGW+81tyDvuXnHR1d9U5mn
         2+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXntsLWLjHZSAsvc2RQoc/Eq6w0sCQUYXONm/PMpkOcOItCey4uv6qA8C+xb8FKwsXCOO5eNACCd1sAM5e5cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxikgVxP5RPt/Vc4OrE4P/tl5Df7rIPo0QJXpzO9bZDRzGp6gtZ
	AlsHziIlZqNGQe/ef07YDmPRr9XINeAkadnRAO7fQRJfaFyowjW04Mhb
X-Gm-Gg: AZuq6aJjAyTU+jHcwqm7Flx4PKI/K/OUKGLpKem5g2hNziMWXsNRJGk06Z7dFtu+HtN
	bce25bwTcCAKCIL49S6+EaLKR0JD9Lcg7W1wM/oa5UDU01L/LcDKdXo/faI3msIkfAiYbw5F4Qe
	96EMpI8H+mRqbmVus0U8Qnnn/QktReeP3Ea/fVGDlzgLopgB2qnbVV3jvIotlFwDthzHcle0f6y
	8RUvHFKk3wB1BnPkFBREZaqY0jwVbBraL1AqzeFMAD223dZFD8uSqM1EKkAYZk4leLhFME7YEkb
	wV4Ud5INwYYFPOwqLe8AKr0tiLHkXuicsAu5T30rvAR5fK+1aJfmuWmM7GfNKhQBpw60WUiNjWy
	bsSnKMG6N/E+N/vLrPH/GWf8l84RONQilDVLdI5xdWJ+w/Qu6VxgsjdNZyBEd0BIoxtQoEGxZYd
	Y6H8XnE8fTMsnHm9MJgVA=
X-Received: by 2002:a5d:5d0d:0:b0:437:722d:5c66 with SMTP id ffacd0b85a97d-43779ead6acmr12591005f8f.16.1770836796836;
        Wed, 11 Feb 2026 11:06:36 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:36 -0800 (PST)
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
Subject: [PATCH 7/7] arm64: dts: mt8167: Add additional mmsys reset bits
Date: Wed, 11 Feb 2026 19:03:28 +0000
Message-ID: <6f803b6dd1f61728c17afadd2fe983e9fdc0c109.1770836190.git.l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-4932-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-watchdog.org,roeck-us.net,kernel.org,collabora.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 226E0127100
X-Rspamd-Action: no action

Some extra mmsys reset bits are defined in the Lenovo
Smart Clock kernel sources - file cmdq_mdp.c

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 include/dt-bindings/reset/mt8167-resets.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/reset/mt8167-resets.h b/include/dt-bindings/reset/mt8167-resets.h
index f77c2ca897cf..b379f8f023d5 100644
--- a/include/dt-bindings/reset/mt8167-resets.h
+++ b/include/dt-bindings/reset/mt8167-resets.h
@@ -33,6 +33,15 @@
 #define MT8167_TOPRGU_SW_RST_NUM		15
 
 /* MMSYS resets */
+#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT8167_MMSYS_SW0_RST_B_SMI_LARB		1
+#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
+#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
+#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
+#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
 #define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	22
 
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */
-- 
2.43.0


