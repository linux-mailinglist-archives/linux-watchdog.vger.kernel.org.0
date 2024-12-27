Return-Path: <linux-watchdog+bounces-2635-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A789FD72B
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 20:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 328E218855FA
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 19:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BB61F8AFB;
	Fri, 27 Dec 2024 19:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qem/ssVn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28C21F8AFA;
	Fri, 27 Dec 2024 19:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735326178; cv=none; b=QYSoWghLSu/LlrO0Q50jtdO0PEVhBTaX6upxwLs0aAUmjs8GIdzL4V6rVeaKYz1SVaSp1bt9bE6ksfqaUa5jkLZxubs+KvEdWqm58ht8kpf7zYwzYPiZjQ9BE+uA03FD+mMNihGXFy/x96HIg05dJjewwgRUhc4YUzJQZryQyHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735326178; c=relaxed/simple;
	bh=/2v+8DQmt1d2K4GRQHxf7IKqlYV1/3d13ebQ7bSjtcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTv5c6+l1yIudAib32yQvxJJCqtioue0FpRF4ncHER1E/CKD5LeQitN3+J+gtHcDyULKtmiqwz9d1Ckz+kZN2j/P4qBL9Q7VQdto6bcpZPzm6W12PckiFu6G76tk5FFKQm14q6J0matexJ2infz+z/00R4JsP7Qe32dMIVzCXTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qem/ssVn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21a1e6fd923so25269915ad.1;
        Fri, 27 Dec 2024 11:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735326175; x=1735930975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cdwdafq2KFtN+ISz9d7l77wWVpFhnyf4uHH34jD5n6k=;
        b=Qem/ssVnfJLCdUMFEygD2sKcolhCMvKuKkcSxs1ki4xUqSQQ8zqr46bOqkWhAis2A3
         IQ5XE+Dfcnw0xRLihEWxmPzxeXJuvGdSlX1a9bsof41dAZSzLRSXE5n8d+O20Mzif1bC
         1N9lG6w1Wz7+nYKRUePZ/zmAUHOURt0/XxSaZCwto5xh1+AnhrOjpLO7h7NOrg9KNtGb
         bY6oG7eXF7GhGA8bf/tqHAT1QUu0V93u3y2mZEGr9ysKq6CE7sJ8Kgew41NgDcwUCDPO
         4ipjk4wKYJZ/hdU92FxVvXPHEwALOTcx+aiNr448X0LcfZ21+6nL+vd2zqR571o93V3L
         AmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735326175; x=1735930975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cdwdafq2KFtN+ISz9d7l77wWVpFhnyf4uHH34jD5n6k=;
        b=l2yDTVyzQG8cy8nx7SHc4MfbMehwwT4Lx2vdFVwtQjbFSPF0H/0ajPo/OYWregc4Nd
         h1UyhWtD0gdPJkRBBuMXsK2BMdxojMwpI2H4WqU/J2XWlVlq66g3xU5dqW79Q0M71vFr
         3/O3gUyxQhpKICq4Fe2d/3dFmcYMzreF+VPZoKZ2jb7JPGOoZqvL1Bi0EhwTtQSw1Vj+
         Ph7/20me5NrpUWyNqE0FE8KBP8/WyU412Q69L0/34rdoxOJ/ak4+R8/cOhqmhWVwvJ74
         6bcCkT3t8erOyRs04oMaqji1gn+GwyqguDQ8JbgU6SkNNB4iPz41MYcEz+FIkVCfsWZk
         a0/A==
X-Forwarded-Encrypted: i=1; AJvYcCU8m6xpyfH6J+8BwzYVlrARFSKWc+qUUPpUHYfEX3E/dgvNTkX8D769bLv+Y4u2wx8YIzfyJ0BVduEx@vger.kernel.org, AJvYcCUP6Px7CcRmKittVkDDgVKY3LrzdX94bVGV8S8WjhPnbCs1YDHqnwFMnjZGi/ZozAe3c/Xwhg74Zrlc@vger.kernel.org, AJvYcCViMewDS05aXpPQxiONoMw0fPu0jsIc9qJkdj6UcRn6l4aa90frCrGAZSICY+neJcJ4EdNAyvFPZW8uXAUK@vger.kernel.org, AJvYcCWUNl05HehW71taYyjhq8u3rRuya/dtv9d/KVVNaSuFRv7bPPoOCx1SVyLE9HCNOKSm/wAA81/RNVy6xJDG3z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWHh0sRB1KiBwoBQuj21igOgRRE3c/WpU1TUejMwxSf02MvRRM
	eLupkgJdWCm5a5P6A6Aa1qfk/xBYXG2HLzd2Xbjv0Tx5JIMILMps
X-Gm-Gg: ASbGncsu8NJs30JVh7wX9jnEB9rEXX70uIbzjhL700eXqDwvpMeFCniAm71vcRIeYlY
	WpZ/6dI8X184diIw1tvgpIeyr5w/GcLgxIKXQt5f0zVSYme0fjadQBacBQT9rGVsFr+o6TRUqkA
	NQxyGaPB7nXp/v9uR3BfuSPUB56hxgYsXCrMdpwtyxUZDsUJ/pSa7fZou+7G0R1j5ipwFqK3Lx8
	HiyQa0g80NFCXaseq9opf2fueermUHdpUwxFuLdgMNkeRM57uXcd5Bzs7x7VykeejfgEx+WvG6q
	A25FRBY=
X-Google-Smtp-Source: AGHT+IFnLl0xawpTMIF8cpdqMqcPC8dId5xJuM7B0czkmo59huKzFBKVl6X4E7jOemWVKQDh/UuGLg==
X-Received: by 2002:a05:6a20:a108:b0:1e1:9bc1:6d6d with SMTP id adf61e73a8af0-1e5e07ee6e4mr54992785637.31.1735326174913;
        Fri, 27 Dec 2024 11:02:54 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbd3sm14877943b3a.110.2024.12.27.11.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 11:02:54 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/6] dt-bindings: watchdog: renesas: Document `renesas,syscon-cpg-error-rst` property
Date: Fri, 27 Dec 2024 19:02:08 +0000
Message-ID: <20241227190210.69025-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2H(P) CPG block includes Error Reset Registers (CPG_ERROR_RSTm).
A system reset is triggered in response to error interrupt factors, and
the corresponding bit is set in the CPG_ERROR_RSTm register. These
registers can be utilized by various IP blocks as needed.

In the event of a watchdog overflow or underflow, a system reset is issued,
and the CPG_ERROR_RST2[0/1/2/3] bits are set depending on the watchdog in
use: CM33 = 0, CA55 = 1, CR8_0 = 2, CR8_1 = 3. For the watchdog driver to
determine and report the current boot status, it needs to read the
CPG_ERROR_RST2[0/1/2/3]bits and provide this information to the user upon
request.

To facilitate this operation, add `renesas,syscon-cpg-error-rst`
property to the WDT node, which maps to the `syscon` CPG node, enabling
retrieval of the necessary information.

Additionally, the property is marked as required for the RZ/V2H(P) SoC to
ensure future compatibility (e.g., where the same IP block is present on
the RZ/G3E SoC) and explicitly disallowed for other SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Renamed `renesas,r9a09g057-syscon-wdt-errorrst` to `renesas,syscon-cpg-error-rst`
- Updated commit message
---
 .../bindings/watchdog/renesas,wdt.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 29ada89fdcdc..ca62ae8b1b0c 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -112,6 +112,19 @@ properties:
 
   timeout-sec: true
 
+  renesas,syscon-cpg-error-rst:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The first cell is a phandle to the SYSCON entry required to obtain
+      the current boot status. The second cell specifies the CPG_ERROR_RSTm
+      register offset within the SYSCON, and the third cell indicates the
+      bit within the CPG_ERROR_RSTm register.
+    items:
+      - items:
+          - description: Phandle to the CPG node
+          - description: The CPG_ERROR_RSTm register offset
+          - description: The bit within CPG_ERROR_RSTm register of interest
+
 required:
   - compatible
   - reg
@@ -182,7 +195,11 @@ allOf:
       properties:
         interrupts: false
         interrupt-names: false
+      required:
+        - renesas,syscon-cpg-error-rst
     else:
+      properties:
+        renesas,syscon-cpg-error-rst: false
       required:
         - interrupts
 
-- 
2.43.0


