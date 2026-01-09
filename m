Return-Path: <linux-watchdog+bounces-4779-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E014ED0B5CE
	for <lists+linux-watchdog@lfdr.de>; Fri, 09 Jan 2026 17:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A680D30A59D1
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Jan 2026 16:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F16364E90;
	Fri,  9 Jan 2026 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BWdl+UWm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qdT2WcNa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3430F364E93
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Jan 2026 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976958; cv=none; b=MbQebBvAkHpdKIK41u284uEEER/jyYdtJ/NfI62q/nIrMjUW4UW1gtk/Iaq8I3Wt/mg+0StUsukFOuU53AjR2rboEx6ZhA5FMoS9o2JOf4FS2D2n2V99lFffJY7vdtQnT1wxVevlKL7zCZnZpKcgOTmytwz2PY9ZC82abuEtffE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976958; c=relaxed/simple;
	bh=2qjQra2EFD3Y/w4pfPSWGJZIKlGX3lfdWrzzclhHb+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ih4eZdGRKmcPsPjG6PhYuF9N7ogaEQs2VnlpLcIwXbfgrttRJYy3X8eiEyRK+0RYG/Dc20hg8LXKRxV/dTenOPNZhkuaqQAky6h2UzzGGC4/VrnAN49D8K6WbRvy0T3w1BhB8qsRum2mAA8klK2jdGZV9n0JNQizpSxRlBYirYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BWdl+UWm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qdT2WcNa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VAn+XKuQ47D8yqbQ/yZIHjXY5+WjSACZGHAy4LHu/3Y=;
	b=BWdl+UWmWUDINq4x0C7Cv4sVyCoCIkut+Ium7UpBV0IztZ3OwjuiZDScZMyfIdxI7b2rBh
	h6gahE4nBJPtd5sfEWovH2iL0po1vroEbgykZwKhkD/WmxR2EBNfHbSScskBPJ2wjFEzIX
	QYQZF1lYQ+lhXyJnuUvZIFmdoKZCGq4=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-QXuNyvP_NCO21zDH9wyf6g-1; Fri, 09 Jan 2026 11:42:32 -0500
X-MC-Unique: QXuNyvP_NCO21zDH9wyf6g-1
X-Mimecast-MFC-AGG-ID: QXuNyvP_NCO21zDH9wyf6g_1767976952
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5634dbbc1a2so1993496e0c.3
        for <linux-watchdog@vger.kernel.org>; Fri, 09 Jan 2026 08:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976952; x=1768581752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAn+XKuQ47D8yqbQ/yZIHjXY5+WjSACZGHAy4LHu/3Y=;
        b=qdT2WcNakaH3vxmudHPdextYLdAL4xeQhFgbDmLd0cFirltMMS6DQ3ZNGZbu96it7u
         TYFfvqvFXhCPh4lvHkh2BqQs0+QKs9g594a2TlSayUuwK2PZxvtX/ufgZQrdtgqxAM6v
         oOAdiWLZh4YLqKWMN4lXvivDKBf275W6tv3GtLilA8sZpicaIc7J3wUtRHNi4SdT+AJo
         m/LhWvrGRIqf5tg5g/0u4lHBobFOAGGouYcPdXtMqBQEKe0BN//JVgeinTKAVHK9Y56o
         MvunDN0a7t5gXN+Q+SogszObQ7DkhFbQdszOv93hFSysau+iTNDAGcy3lZjCAwHPRgwC
         nD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976952; x=1768581752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VAn+XKuQ47D8yqbQ/yZIHjXY5+WjSACZGHAy4LHu/3Y=;
        b=D+gJwKmQbhewXp1/GPk/Bvk2UO1LB8KsPAXLUtDFqAt+OpfhWtClHZT59ldqpWxuV1
         xRmpewUbuq8yiPRpB5Bm4nBruFte8fKO5kmiGyC5S8mWSh6toy6j4U48vFv0a+/r59l8
         voT+dW5HHQixqrsGe0HRiq2WgThBINT0r2SvsDElxzADsg8VN1KIg6b0I1ErGyEk8B2j
         NprKep7S8uPlSxr1kK5SBMh0uUljYGSeIgV8dg+4O32pIPWjMDc017FzFo/d5WSXEbIN
         +68eRKic7flspnzB0tpBwiWJ3TkSy08NuLn1TcQOU3ACQGoDtuL24AojOnLL7dflAjYX
         xLnw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Zyuq3ZBaStwYTeBBTgUt0QYQSgG/YMUV4V5T/3bI1gHjXlLfQl360TCK3+FabVmDAPRxhBiq8ecGB/ssDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyF4ELqKd9bbSKGrbdQpYEZGpJ6QVdiJVjzTHgLpuDqfD7ORA+
	gWD9Ps2XxlT3HvZIa2awKFayh1SLupy2DVRsuyUoLZzY1RViPYn4wY+fJ9Y+Lxu2cUCyt+cy/yv
	18TtniK6qxGRwioWPqCcVpZiMTVkDz+XCQEJYKG9A1X+BFEZpHzAu9jwsli9C1mgqkAqE
X-Gm-Gg: AY/fxX7QHvDIXo0ShjSa3JGzT6gTH8eFZ0XF/u0SzZz58fb51rVKD/4AZ1YcPpC6kcj
	nCYvSwRL2fPpa1z0tsbSIiI3q/Rtg/2qd8GtF1uIbGwN6YaD2Wu4StDlcJf6B2uFAwUC+DjNhqS
	SEmHFKpG1U1aA6+OY5ZmtqfWSi+fjhHtlgXUPcNzR/5eJZSTCV/rDW00lpbZHGW0/HHfmCjIFNI
	PYBSHeSCBD3JFR0UUAk7uy12xWrxludp7HynPGv3nG3W3GpDVddHocjL1C4YGkmFj4cchPFXWzE
	mv6zC94ZlQZF06IOkzU+5faZrBAo3l6iG5oireEWTNc88Jxbj/LPxyOPmbBf5otG8IFu4aCmiR5
	KGG96f81xd1IWJJ29ZtEtSkeQlYkLupxu6/jr+lDH5kHx+diR
X-Received: by 2002:a05:6122:9001:b0:54a:721a:e4db with SMTP id 71dfb90a1353d-56347c2dd4bmr3914798e0c.3.1767976951898;
        Fri, 09 Jan 2026 08:42:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKIttTOylcFmdXlFSY6YzzA98a4l4SwTeUyaxFjkv8WhPZktN4h7/RtAemrct0fT9ia7xpgQ==
X-Received: by 2002:a05:6122:9001:b0:54a:721a:e4db with SMTP id 71dfb90a1353d-56347c2dd4bmr3914788e0c.3.1767976951556;
        Fri, 09 Jan 2026 08:42:31 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:31 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:24 -0500
Subject: [PATCH 11/13] watchdog: pic32-wdt: update include to use pic32.h
 from platform_data
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-11-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=2qjQra2EFD3Y/w4pfPSWGJZIKlGX3lfdWrzzclhHb+w=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y9+31s+d2larE9y08S5P9K8HjPskYpyOcj6vTT1+
 OFpDXtbOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZiI/0xGhpZw7ujW1+/2t7Ed
 KjT7Z/fu6V8upSbJiV23Z/yKWKIv+oXhv/eSsE2PH8w/crRk9Xt99aLOu6oiFu6dK/7yr64Pevn
 5MS8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/pic32-wdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/pic32-wdt.c b/drivers/watchdog/pic32-wdt.c
index 1d282de312ef1bd683529088fc88456983e8efb9..2e7186b85194645d40f32e69f198514fca83b601 100644
--- a/drivers/watchdog/pic32-wdt.c
+++ b/drivers/watchdog/pic32-wdt.c
@@ -12,12 +12,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/watchdog.h>
 
-#include <asm/mach-pic32/pic32.h>
-
 /* Watchdog Timer Registers */
 #define WDTCON_REG		0x00
 

-- 
2.52.0


