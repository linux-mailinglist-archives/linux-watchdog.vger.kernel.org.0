Return-Path: <linux-watchdog+bounces-3097-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2181A5F3F8
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 13:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 831C7189F617
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 12:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5756C266EF0;
	Thu, 13 Mar 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGWLjSBC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5A7FC0B;
	Thu, 13 Mar 2025 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868123; cv=none; b=bmYA7NFZ2lKuSvGZz4PYrLHjIq/cpNrf0Wbsvn2SuUqJk5Vky7Xd3P3RnBwaM12vKliruJPQyKjBbMTVe3A63JZ5RlmgAfbq4iNiCvz8bv203k9xiYvtu+y76H9Kuh4ZP436/Ecp9SXKOOBw1urblmhzY7XP4bTjLl0+4Pq78sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868123; c=relaxed/simple;
	bh=hLmDo0j13wZm0z98fG6esxZQVY5Sso4WiGan9W8ZMVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5fYCgMs8LTIMJHzpVb/RAWPLwzl1oGQDRyCgT6I7GVKmOTa376y7yT1Tm5U8uOUSFuUHj3XVZtnvAMDwalfNnUwqJzKJLor/nTPYI/ZvgS4NBFvHHLMoLMqKQe6uulfYeZn3sLRZt2GRREpdMyYkv+s1KZi4m0Xic5qN01fS84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGWLjSBC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-543d8badc30so1034019e87.0;
        Thu, 13 Mar 2025 05:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741868118; x=1742472918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcWyZIGRZ0V0VnjdnEmGXkiK0tOATgxayTp5UfiuylQ=;
        b=XGWLjSBCeCTbB7z5X3wOmuizPfnx6pnPaDquvsdo4VudcYrtnxKT97fD8raOG/sEJn
         0pm9YoRcf+1eDVyISn06KQLVfX2PPcjwcnZZJGNqptcxZWv83PKL7oNsJYrp77uVavHx
         r+fvKRZUa1y06UzxAU27FC5V9xC1AZxpvSBMRPsS2ReONzgHtGAyUU0ql/+p6qzIriu1
         EtN6uELvN3yw1oPGET0K4drabPLJwf3n96IWKmUH/sDPS/SS/LOdBltfLz2rnXtutfd/
         4RDQS//GfRs5iYa+2G3jxgycyIFFyCMy0zep3eU7w/E8iOt8GDSDhPX/czvpN041898W
         vbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868118; x=1742472918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcWyZIGRZ0V0VnjdnEmGXkiK0tOATgxayTp5UfiuylQ=;
        b=laeInhIuZamTMyy4GP+ZI9fnRSayalSHj3QTGeCWvmNytdWhQpkD06uAxQ6mxql/lM
         bMhx5wYlBMl7hviuAz2+wFKcOzxpT+AG7YjId3VouY8rg01OsKifZx8GgoNeKZVdvTrd
         XtuPL/KST3gtlMeH4SgLTYqJVJPPhOsrcJJKYJ3o2B2hKlKcA2xHqOZ7Pf6anThdC5wQ
         GiMH1VoDwEjih7j2jvE5rK6C1kSaIKhUX6/VTxXA8BrLfmBtB3Yl/mK+CXIybkOVlLX4
         WWzaN0FTDaQ/mMjTNrnE1EsLw1jaIBeekXyMYfQwJsOXmlS2oGomzkH+sZZ65qENmQJa
         EZoA==
X-Forwarded-Encrypted: i=1; AJvYcCX8LQtoXIcrFY9IHvqLTOSLegh4XO5NAYMS3wkREzzd/gOWBrweBnjlgBkP9zZBq9Mtyome0W1zSiPYvIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ3rKOJ5oEF1WfMREzVlbOI/f0xJT0jZUjlfRrYPpvkM/pUfuF
	Ylv+p2eUakyLcIMJ/iDZX9nhzvKj0ax+5Id576lOdR1mlhVS4ZKW
X-Gm-Gg: ASbGncv5zNLm1hdDc4YXBIfct9uvFc/GxSo2ZkXZJaw8GF82/bZ50OjgcQBKRiXprmm
	bNRB8qxy5jRTeMJ23ZM+ReFRZjncyMFQm8GwrvWwLeHVT6Jf+FdfNQ8tmmVjVEF3q4rqKsRFvG+
	9lAXM/sRHY3zm7jpPEooRhGUjpfLGf4qhIE3UHfT5Vdfp5JjT+cXoW8rIcu6Ggr2LCpdzLHpmWF
	b8O+2EJzDn3atseuPuO+PGwgGwehqjl73ZpuluOLIzLqNgrj8RbOimQJHR95vx9fXdsDLT8+jME
	9C4bda3whr3gcjqp0s6qD2bTA+x3B6VcHoogTGiT08riPZLT92oQSjK1P94KKojWWVQvGnlpi9e
	Ho1uF/Ge8ane3
X-Google-Smtp-Source: AGHT+IFc45U6LwgHiIwUbMq07bQASP2bE3l0stD6OckyQZEsZB/XVK8KMt0taKyM2lmw15xgeqsBLw==
X-Received: by 2002:a05:6512:118a:b0:545:56c:36c7 with SMTP id 2adb3069b0e04-54990ec1877mr8426209e87.41.1741868118269;
        Thu, 13 Mar 2025 05:15:18 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c192bsm192851e87.89.2025.03.13.05.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:15:17 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 13 Mar 2025 13:14:41 +0100
Subject: [PATCH 1/4] watchdog: da9052_wdt: add support for nowayout
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-da9052-fixes-v1-1-379dc87af953@gmail.com>
References: <20250313-da9052-fixes-v1-0-379dc87af953@gmail.com>
In-Reply-To: <20250313-da9052-fixes-v1-0-379dc87af953@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=hLmDo0j13wZm0z98fG6esxZQVY5Sso4WiGan9W8ZMVQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn0sw+yhOHeBqpf3/zWTpR2Q2KknGSeOqbVyGqD
 iwDNWNtHA+JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ9LMPgAKCRCIgE5vWV1S
 MqzjD/9voJpMZzeGOnShEGFH2OtdgZkVLiGt6RwUSiQ38n9pzH4qshHJMB1ucu7khU4z2vG92WD
 kG5o9jE3R2JEvJw1D4R1VJMTXudFdt9pP+1xF3mhGYtdGtGvLm85FGON8GlUUE1XKyCYnfUkoo/
 zQ5UhSHWBys4mtwYTuN8iULtr+0JuiZeajL/7hY+ngWamZNyRnfofEFpHd7DWc3WhDOTCyalhpu
 lmYA1vwdhmmcDUml0ZCKs2mKkUU5D61IF8bZ9yzv//kEW/EWVMYlyHPqlexjLD04l5ifFBJ3B/G
 YuHO0Uu20A3R0Xw67kWDUdu75xCO5VA12e+PqKj1Izv8T77JFjJjTT+RTNWFKYEScIpSffHt/gp
 YWgOhNhij7ZJeriR2Os5SOErl5gnzafavKftmHKyz7jbxidTr6ck3kGMCKuJXne+Tm/1JNnymcd
 J/19cu9HUkIWbL7d058T9CFSepKlAscIq10K0xPgeTXPzip/X6GZQPsNENujQT13CMzE11wGfm9
 6FxnwC3UouTkLKz72WR4XcWGke13+2VFekroDulhAYPQtp7Ri+KP6M+0Ugnx+ZPW6FnVcxecoeE
 zHeLIjFakmixYtnuUX+mS6iaoAbi3oI6x8Gs8AA1jHSEOVXY39Lfxs6MihXB9swjJCZpsEogoUn
 7KII15U0xvDDTJQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Add nowayout module parameter for not stopping the
watchdog when userspae application quits.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index 77039f2f0be54273df1666fe40c413b6c89285a1..a8ff1e6a7903f6f139c5bb60d7d92ca39077ee04 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -30,6 +30,12 @@ struct da9052_wdt_data {
 	unsigned long jpast;
 };
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout,
+		 "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
 static const struct {
 	u8 reg_val;
 	int time;  /* Seconds */
@@ -172,6 +178,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt->ops = &da9052_wdt_ops;
 	da9052_wdt->parent = dev;
 	watchdog_set_drvdata(da9052_wdt, driver_data);
+	watchdog_set_nowayout(da9052_wdt, nowayout);
 
 	if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)
 		da9052_wdt->bootstatus |= WDIOF_CARDRESET;

-- 
2.48.1


