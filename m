Return-Path: <linux-watchdog+bounces-4958-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gESZEHeQm2nJ2AMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4958-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 00:25:43 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A103C170C06
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 00:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43ABC302AD1B
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Feb 2026 23:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABCE35CBCE;
	Sun, 22 Feb 2026 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VwGciJe3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jRxqMBo0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32AB35CBB6
	for <linux-watchdog@vger.kernel.org>; Sun, 22 Feb 2026 23:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771802701; cv=none; b=J3DB/mYgG05bHcYvJr+7VgsgxIT7EZY5BEmOKNmU4NMYOPTl3rK0IxeiWfW68SPnbWUMRb4exy39EmEIG/fIU0CJyZozINhrXYOjSKmLYvrpKHpCwfcMS4zWRJvYku9pJOYUaFEgXsxO4U5u9+Eahi8j5ZONVhLdIlUC6CuKjok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771802701; c=relaxed/simple;
	bh=Nt4mCrL+YmohWvIndvwa/EMu+2nb4nwhSPBS2zGUP+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjoN2Np6e2Jqrs5SbNhbxM7KhzH996GChxMpFoRy7f0NRzPPkVMHEmZD4CSYMk2NldSzwoNXHqr0tvusIHLz5hQ45fTWvg2bbF0wP2rsmO4VYR5gEzbNPlDYVLxcooiE2vVjNfgDRXLObg3pQCv0vkr9bcdYLQtW75CnoiqiGfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VwGciJe3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jRxqMBo0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771802698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSR5ALHHY7krp6Tdj+qfu71y1U0GGIP9wME4jvxSuek=;
	b=VwGciJe3WXG7bj3AHJ6LrqKKfqV/Gf9+nhRFLt3oHKPd5dqJrsZYhJyDi2fF45bpRoCCiB
	XpchkJl20IqJYfEFvp/t0r9CTBmvpL+KtuSUtDcH5DSoEgLGY/cX79o252Jf8BH3vPvTvn
	AN2CwF810uLHX+gIIzZWVhIAZ/fHNeg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-Ri7dT1NjPlWC5zksf7n7Tw-1; Sun, 22 Feb 2026 18:24:57 -0500
X-MC-Unique: Ri7dT1NjPlWC5zksf7n7Tw-1
X-Mimecast-MFC-AGG-ID: Ri7dT1NjPlWC5zksf7n7Tw_1771802697
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896f4dcef67so582235056d6.2
        for <linux-watchdog@vger.kernel.org>; Sun, 22 Feb 2026 15:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771802697; x=1772407497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSR5ALHHY7krp6Tdj+qfu71y1U0GGIP9wME4jvxSuek=;
        b=jRxqMBo0e9s8hseM2hexcaMfA1YboDz0g1WnO37ZELmF7dN7biELxyrpH1cRdgLHGT
         /KsVzlEHaknzUeGICEIRo05c9i06WVH10HBRG5uHHNbmTtCM9I3b6OQ4uHPF2aWDiQvV
         2xHp6TqKPcLgM0XHW/sTI3IfN2FI4QdXNRcLG5nD2G8s3pCtjSIc+/lawt+Tv/ENeAQi
         4ppehLF/lLp2uWXKsXfTfsU10SEPMBcA0pmJNwCh7Uy0LAhsEvE22Ulb0Jyh8hAocDeI
         iHHjKBoRu5awPxVo0zwJ3nPsM0ZJzNHHasFC6rmr27kCG7FAkXQ96tNjo0IfLj5zwcUV
         Qt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771802697; x=1772407497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xSR5ALHHY7krp6Tdj+qfu71y1U0GGIP9wME4jvxSuek=;
        b=M4eFmdbC9IEmE3eOUMizZlZQkUTgW4C4ziRefAQndOfymn955VZ1gBmyGqamS1uFCJ
         sJLQNpBiBMd8hH+i2IcMoFzPYslp3xzazlj4/DyBti9U+VxTsq9KNK3WgxPSGznU5Rm0
         SQvRL5eqdN3S6y6ROstjLAuEA+DjE7825vJmwhbTav9oLy64xp2bZdxpLfpKbVWbjls+
         j7NnniHdfprciuOBPvbF0V+3gc42y7mWMDw8pxNr7VDwJ6Tg0iRqicFfAhkPmxGjwJPd
         MVU9sAwdbb3nJ8SJQhJuM+1r2SR5z4Pv55qgQ973ZmeBHrk0qlK2Kt4oB6uO0gdfqFK+
         xMMw==
X-Gm-Message-State: AOJu0YwliW0eejlgp45zdX8oSxIAiLtpBflwlu3okbu4yWDgRBFF/Izi
	pT5s4qn4UfwIlUF9sgyhfM4lTXJPc5AOTqTwZDAQmEUFesYpXWdLAOeL+GItAD5dOUKEWyif4O7
	eJBoN2EyanacZI42m7ndNAOjIyXa1sLh0UpxS294/+nE13fGlBEUivGYusySGEjX6at4X4oYNcF
	oQdETuvIEK101lGSKWWduGttFaLPsqt+/Z3R/WpgRkM65xsgsDhK4=
X-Gm-Gg: AZuq6aKirnOdBzEeBFlj/Go/qSFJrivsxoZNgfJRTpxyZYICcCGyINQoNeCiJsAk3wR
	eqHfmpKaWt94g7TWah2ZI7o9L6ar8RQ03E29dc2IZhlOH1MFj5tSCuK3BJi7FfiAdUMd44ucjwl
	16INP3HRrwSsVUtkCCseDPYlRozPzXckCucmdLgJhmUHMQR468VgYoDT2a1CGX60jT771IS9e9z
	3XeJ8AaUyv7BV0FI2Itvytq5cCJGi18KhNpfN0jFa6tdePgoM91f44B2iQG6PEHuyqT9I0k6m98
	BMfY9XBV3Lnrxv0BalD7v9QadCgPJmKbhHAyUgnQj2XhnMjUIpWwvDR7y1hibje6VKlylbH9003
	Edmx/Ao6q7fb34q0cXD9x04UyKY2yeZZhl9LfTigKe09jTW31u6r55RMQG4uRuw==
X-Received: by 2002:ad4:4ea7:0:b0:894:2f04:eb14 with SMTP id 6a1803df08f44-89979d5a142mr106805106d6.45.1771802696986;
        Sun, 22 Feb 2026 15:24:56 -0800 (PST)
X-Received: by 2002:ad4:4ea7:0:b0:894:2f04:eb14 with SMTP id 6a1803df08f44-89979d5a142mr106804886d6.45.1771802696583;
        Sun, 22 Feb 2026 15:24:56 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997e242fadsm53860936d6.34.2026.02.22.15.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:24:55 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 22 Feb 2026 18:24:17 -0500
Subject: [PATCH 2/2] watchdog: pic32-dmt: allow driver to be compiled on
 all architectures with COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260222-watchdog-pic32-v1-2-a2538aa528d1@redhat.com>
References: <20260222-watchdog-pic32-v1-0-a2538aa528d1@redhat.com>
In-Reply-To: <20260222-watchdog-pic32-v1-0-a2538aa528d1@redhat.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Nt4mCrL+YmohWvIndvwa/EMu+2nb4nwhSPBS2zGUP+U=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnT3ASPcy/0N5dcXk5qztXtk7IvYUxp7YlPi9tuOOdy
 NBfqXCpo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIloezEyHAp6d23uKpH2yx/U
 3V/EbdWwDAzUKJnJ+zVYsuSab73wL4Z/OjfPxxZzzjM9tfPXjby8Zp0asyORb4XO2H+XVr31Tye
 TCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-4958-lists,linux-watchdog=lfdr.de];
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
X-Rspamd-Queue-Id: A103C170C06
X-Rspamd-Action: no action

This driver currently only supports builds against a PIC32 target, or
with COMPILE_TEST on MIPS. Now that commit 0f8a61ca78d6 ("watchdog:
pic32-dmt: update include to use pic32.h from platform_data") is merged,
it's possible to compile this driver on other architectures.

To avoid future breakage of this driver in the future, let's update the
Kconfig so that it can be built with COMPILE_TEST enabled on all
architectures.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index ec20bb80bdd5eb9b4852ffc8150e7999a42f7635..105d08ab8715be8712877b8d5a0fbfd0038fb049 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2024,7 +2024,7 @@ config PIC32_WDT
 config PIC32_DMT
 	tristate "Microchip PIC32 Deadman Timer"
 	select WATCHDOG_CORE
-	depends on MACH_PIC32 || (MIPS && COMPILE_TEST)
+	depends on MACH_PIC32 || COMPILE_TEST
 	help
 	  Watchdog driver for PIC32 instruction fetch counting timer. This
 	  specific timer is typically be used in mission critical and safety

-- 
2.53.0


