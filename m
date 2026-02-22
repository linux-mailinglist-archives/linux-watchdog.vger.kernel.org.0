Return-Path: <linux-watchdog+bounces-4956-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D84Gk6Qm2nJ2AMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4956-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 00:25:02 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B2170BE8
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 00:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E73C3300DE3D
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Feb 2026 23:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0895135CBA2;
	Sun, 22 Feb 2026 23:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KBno2Lf9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="h4emjof4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5AE35BDBD
	for <linux-watchdog@vger.kernel.org>; Sun, 22 Feb 2026 23:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771802697; cv=none; b=Uz4d60TCm4KHYBq9JCUPImS+jOzL0t6W85hHHWrEn/UiHkpHPCJW0Z2yZx87mA1irHzmujvTDKFpzFOZnz1HTZuMOLOW7DmUDRfi7YdePqZJDmUnaXgivHVTQKjzLUjD1NYQqP1CpABZ5wCF8IUrMtkmPNdQpY5kCQaMtvJ4iJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771802697; c=relaxed/simple;
	bh=NjKc4brhodNTJOK8xVobB4IRxzXA3EqBZko8QSTwez4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jc8mB7g0QLmke/NjHRVS4CvVxWtHqXXyvBxwbuD8ZLt+E5Dv5g0bY3raWujiFEInEsRSTXkC3vYYXPh81vExBo4BIEMFoJA2YQA2ES2VIvFBv3MQO6pa1W3sq6Sd1/PZAlrFQ1Y3M9fsm+FDbLKNyb849CT8uU7KGcA7fyDbjB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KBno2Lf9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=h4emjof4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771802696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=12cDH34yK+DF/dtdAbJQhV5dW0R4WK3HC3JjcJ6miTU=;
	b=KBno2Lf9vz+qIwwxU5OUb+gloYXr+tGcmllKjMzcbNQ7gfch/0jxOoQADQFbrLIpPFBm9O
	JuibEUjekmnk/k1UdBCvpqQZOe/Hqst6W0kuVfalZxEVHGizxSqSxLVv9lYLj62KjDxSnY
	g3Lve1Xy9aYBevx5yRukPT1fw4RZY2I=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-KpeGmJA1NVeApxWod652yg-1; Sun, 22 Feb 2026 18:24:54 -0500
X-MC-Unique: KpeGmJA1NVeApxWod652yg-1
X-Mimecast-MFC-AGG-ID: KpeGmJA1NVeApxWod652yg_1771802694
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-503915b0a88so62263891cf.1
        for <linux-watchdog@vger.kernel.org>; Sun, 22 Feb 2026 15:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771802694; x=1772407494; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=12cDH34yK+DF/dtdAbJQhV5dW0R4WK3HC3JjcJ6miTU=;
        b=h4emjof42CGitOLAQLwZmpEP7CPVmMuDAZ8hXsbXrvNhZMm9hS2PmZTfn7/N4dm4Ly
         1Ub/ddbHwSsWyTYhHT+7Opz+qczKd97IAFDds2Q2fhxxVFGQlf7URCcB/GNvkdEXDYqC
         hlStNVTw4Ikj4IuKlMDs7kObxGCKfFAWNM5u4MXTRxTgr7mxlT1L/gGmeFirgzl76Ex9
         /gGTbzEBW+z/0c/lemVifrBdhEhBhm877YfovO+4gg4xTW1nYuxxa1G2XV6MqFkBnDqd
         Vn42UsGXEp4ovK8nP1iKuB0f79MWqho0wIwMpbGNejlpZcM8iPuU0cSe9KkK+3FHMD9L
         KUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771802694; x=1772407494;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12cDH34yK+DF/dtdAbJQhV5dW0R4WK3HC3JjcJ6miTU=;
        b=D71gBRVM2oxgUDGn0Qkkt39IyHzgO1DlOWQnmgLrZLoNePOLuDleFunnmIo87qanJq
         /JYa4qWTzGo33CRFXl1QBMvJz+n8pq9sCkf0tTP5sOw6QPFceEO0iXqeWQFBBWbusmWP
         mHjAaeMDtk1bz1DG6o2LlOwC993O9STZsrxgMsQ7z283e544pa/MHpYwYOWZiGEJsejL
         VzRxRnYDCZddRmFVM3vW7WyRisAGNTI8WWo734+j3+OD0XVTXkkcZXnNfn0CGFu9g2XI
         s9EBQpoBiiZQBep9Cfit4Dt7E1e8r5FHKOs3R1DCodlLNoQS75cwWqJpTDUwaClF8RuT
         IDlQ==
X-Gm-Message-State: AOJu0YxxS7eAz/+FbgYo6BKpv3BylRFFBjXKNo1vE41aSwfwFdYB6MPC
	H01rkdkYmrWiy+VkU6lXZrlZuPU0qoCAD6AmKySZaEV2/5axEYTxduXIkqi3Bz+Z+ZXqtODpDiG
	T9Q3F1BUuv0cMLThSuZwd/yZhMSJSFmq+i1Uztgcp5MDYQKosV1zqwD85hAp15EsSxlkX6EwMnJ
	2jCxMOZXjhDFKT8iD0VfDcJDfqMwgdeF48FnZqKYdPh7o7F7ZhRsY=
X-Gm-Gg: AZuq6aKGNAvCwEP+LhGBDmzbcdD0AKHzVIphmXmUYkgjFPkqetGvAEgNaffohc0Ymwo
	MVD0bfOAAD053D2e9uEL21IGyqg20Z1XENRHDSq5LpG3lFlh+8XkH4gFWQfHyrSOsu7j/ZVV6cL
	aOyz6gBBuHlRBK0SmBxp0ukenFePjeYnKqE5Jfl8TPRYDNg2sW/HLL8vcri6VPoPUP6LnjPqhor
	fcKvTy8KtkrdITYiQ+isVC9oeXDk75yM+u9IWajo7wJ4FlkCSC4YA7Q2B8WPRXiCNzoBmys/Da3
	cnce0uU8x/R/C7i03cDaHGK/zp+5q2SYk27dghrXupZ9UnN22x6Ye2x5mumbeLeP3ZKfqG1Ptax
	3E9oDm1zM3R1R3WW8yXEFvG3QMYPCGPr2BGvju+IQ7CwSB655uuTjd4ZzhpSFkw==
X-Received: by 2002:ac8:5906:0:b0:4ee:2352:1bb1 with SMTP id d75a77b69052e-5070bba117emr98297841cf.5.1771802693800;
        Sun, 22 Feb 2026 15:24:53 -0800 (PST)
X-Received: by 2002:ac8:5906:0:b0:4ee:2352:1bb1 with SMTP id d75a77b69052e-5070bba117emr98297631cf.5.1771802693405;
        Sun, 22 Feb 2026 15:24:53 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997e242fadsm53860936d6.34.2026.02.22.15.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:24:52 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] watchdog: pic32: allow two drivers to be compiled on
 all architectures with COMPILE_TEST
Date: Sun, 22 Feb 2026 18:24:15 -0500
Message-Id: <20260222-watchdog-pic32-v1-0-a2538aa528d1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBNsjKCuEi1MJ52NhkYF4t2Tl
 m/xf4FMiSnD0hVIdHPmGBqGvgPjdXAk2DYDSpwkIopHX8bb6MTJRqGQctjn0ZI2pKBFZ6KD33+
 4brV+b2Uz52AAAAA=
X-Change-ID: 20260222-watchdog-pic32-001b94deace3
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=NjKc4brhodNTJOK8xVobB4IRxzXA3EqBZko8QSTwez4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnT7At9A97/+r/0S1VxWWiLnu43U58+yUqdfDMFT3tg
 /6sW8QjO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIsZ8Mv1lflBnuXqX+z/X7
 I+bsCIYV8xoz5vDV6pl9Wz8lReC9TwDD/8h3onMNYhi2cypwvTd+cDjUPDQy7EpOpL14t0qa0JJ
 NvAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-4956-lists,linux-watchdog=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B53B2170BE8
X-Rspamd-Action: no action

While migrating a pic32 clk driver off of a legacy API, I mistakenly
broke one of the drivers, and the issue could have been caught with a
simple compile test. Now that the dependent patches have been merged
into Linus's tree via the MIPS tree, we can now enable COMPILE_TEST
for all of pic32 drivers in this subsystem.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      watchdog: pic32-wdt: allow driver to be compiled on all architectures with COMPILE_TEST
      watchdog: pic32-dmt: allow driver to be compiled on all architectures with COMPILE_TEST

 drivers/watchdog/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260222-watchdog-pic32-001b94deace3

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


