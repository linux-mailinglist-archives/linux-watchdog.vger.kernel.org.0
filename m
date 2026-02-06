Return-Path: <linux-watchdog+bounces-4910-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNywDyvQhWmOGwQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4910-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 06 Feb 2026 12:27:39 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4EFFD3C1
	for <lists+linux-watchdog@lfdr.de>; Fri, 06 Feb 2026 12:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 430A030BAF28
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Feb 2026 11:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A9C399003;
	Fri,  6 Feb 2026 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFLmBuxe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16514394481
	for <linux-watchdog@vger.kernel.org>; Fri,  6 Feb 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376951; cv=none; b=RMKh+UC3/Xr+VNebbIdH0IpZfddFlTJZP7sKdGUaneE4jSDK8ARFFHAAdsf9cQU32cbOu7y5ZmQCCmvfcRBWfuv6Q4nrSJ+7JLQJenXIZfbPW/rUeKzuiSvqaBuJsh2KZMYV/1uFbgtqb7afcGfJkTE1zoGblRN1hvYcyjryi0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376951; c=relaxed/simple;
	bh=7gw1F0zCbivI23oXYqK/q/zdgx18STilEDUYAHDiInk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JbPwj1ULuaN+UXMMc4/i+jkr49jAZz7STtKHwI/dzqF5t9lUfPjryy6mQIc3DyMhfoBg14eO33rxFvxk9d8btK2n22ZuUd3uoviRmm7PlKoGKeJNrRuvAXc1s7ScfH9ihH8AvgX+QvHzRK1LoRKsSov1iP/D17z7makTrv8cpAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFLmBuxe; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-4358fb60802so1345793f8f.1
        for <linux-watchdog@vger.kernel.org>; Fri, 06 Feb 2026 03:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770376949; x=1770981749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4TelEWJudPXaqmeKeI14SuXYP9n5OUB2TL/zlU502k=;
        b=KFLmBuxeR4xx0J4Tk2d7j6CsRYcyPc+eqCAjQXiyFb14KZa0rrSHnHSBnv1kQ9KWN6
         wSWRTm5WWcgU4qrHM0GsuURNyt3AKif9mlNjikHmlsaoFxGuatY/mZ/ISSg6cI87Zj6q
         c5Ky1vhrgVCSmWe+0LCuHd+6GaKyjPyN/malx1jFKiDSjp6zkYQJRICUdmCvrsMnfg65
         tWs9Keqyb73dqHK+cRZTybM7xTd7gNe6VgpVDkQe2RxFnqnD0j9SLvX9QZVI1a3bPnJL
         8tV6enFueRBAwqI/DBX47TtcIhLLmZbi+nZL5ae087UHcIgbPGnzF3fsDlbha6fr9Swx
         MHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770376949; x=1770981749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4TelEWJudPXaqmeKeI14SuXYP9n5OUB2TL/zlU502k=;
        b=AeWsaFgUdzEoJIYlbQDyJJsOPd5eKBfFtT3chV2Bn4lHJChsV+4fbBKJEGA8EiuBaA
         WCdJ3IYIFDDgWbuZqWaka49+t9gPEmKNumsb1bUUKJNygDKPWrZz5LTo6czVMcwTZySn
         Nr5BnM07T96ByRUf/GNhbaY+FsuAoMAkKwhpCfpu8IMiM1Aqm5oDG+JwjRa447JAx7ql
         YBn/74Ji081tp6LdL+hZWVbEX2RWVW4q35Q368gBKJhOORY3yHS0WYUMENwOezMpSWUM
         WC68bmtoYK0BzmLQYceEuVkBkL+azJ8zAzJP1CAU4TQ/mbFtPKoWKwBH6XSH5E08+rkv
         aZtA==
X-Forwarded-Encrypted: i=1; AJvYcCUy1XLenKgcaWQP+EZFbCAWLhABIZIXK30i6JCaSYKnTLFRNhK6Cy5/tVfJBpwSNlk2NmZQIAwMkAiK6OIwlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4r6PRmmkvb+RPzYkcKmj1NrB+xt1Uha0y8ds2nr2EvneMq29W
	dJoRVohWCWYFXMk1jEOPPbwxcOxo12CtypMruR9V4MhyLVC9Jx8qhhsj
X-Gm-Gg: AZuq6aJQybrimnQkr42ckRZf31n+srFonsaXhbZ68O9yWfLIFhjKWXBYgIXMHvP69gw
	gXpxKIxcl/is4/psOQdKrM6jgP+50o01p7MZissoR8hTB4oLMlAK7lWLfol+EkgSOs1pJon/7iB
	X1xZUXEKHdOyNCH4yKZj3lFa0dlbgp70FcqSBGV7qBUqbOC+o9c/zyGZGr+Is12EOlefooqL+cz
	dKPbIVi0MpUVoTRxVt2vhA/eHiQ5p4DMgZ6Ixe157gWI4kyQUyxI74Pk0zjqev0c9ptj+zqo1Ef
	6F01J8aigPkVKUAmowwRTeUIVdXsO/kIpIRkhF9u+SDDgqzXE2bO74bqcVUmWheSESAiNtHKTYf
	21RSAkTTW8M5JY0WULZiw4skkMit+2KFJUeXWZ+GeAcAOqLnrOUl896fAbu+FiH3v45mze8rifU
	gkANaL15NzfG2GkgGMYg==
X-Received: by 2002:a05:6000:22c6:b0:431:f5:c36f with SMTP id ffacd0b85a97d-436209d13c0mr11282700f8f.31.1770376949190;
        Fri, 06 Feb 2026 03:22:29 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629756bc3sm4708676f8f.39.2026.02.06.03.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:22:28 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G3L support
Date: Fri,  6 Feb 2026 11:22:25 +0000
Message-ID: <20260206112227.233229-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	URIBL_MULTI_FAIL(0.00)[renesas.com:server fail,bp.renesas.com:server fail,sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-4910-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: AB4EFFD3C1
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the support for the watchdog IP available on RZ/G3L SoC. The
watchdog IP available on RZ/G3L SoC is identical to the one found on
RZ/G2L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
index a4d06c9c8b86..40b4fb26d9c5 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
@@ -18,6 +18,7 @@ properties:
               - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
               - renesas,r9a07g054-wdt    # RZ/V2L
               - renesas,r9a08g045-wdt    # RZ/G3S
+              - renesas,r9a08g046-wdt    # RZ/G3L
           - const: renesas,rzg2l-wdt
 
       - items:
-- 
2.43.0


