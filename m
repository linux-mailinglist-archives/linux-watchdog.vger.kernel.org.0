Return-Path: <linux-watchdog+bounces-3132-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB6BA6EA7D
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 08:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82A983A8CC1
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 07:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0863D254852;
	Tue, 25 Mar 2025 07:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIQYXfpd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DD4254843;
	Tue, 25 Mar 2025 07:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742887674; cv=none; b=PoyT5iIW7deZdDzMxa6usBk3hudKorRA89YfFP9XmuS0GqJErlU0rZb+egckntqC+vkoKSVySLaGamXuTuvgFU7ZM0yavoJmS5wcQnKS15cTKCHMBayBP1ds8+J9f7OkFOfiUO95rfuIosvsIOQburYlYAh8BR2QTTLSrJrWU5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742887674; c=relaxed/simple;
	bh=9/EAEv5asPM55GhtBdL4KSWn8n4jP3zQOqSm7mRMI+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iN7YMIPqxdsZCbwwLevvHt+luYARJ1yb1jhEXw56+XtmtKGzLKhFBYb5v7vNi4Ya9u0o/c1tHrMhnL5e3N+M473+bERj6paE4SUKw+YX7wwAP4KZK10jXC2HmzQzYU+yJBhB0K0mwK2sL/ulWxkJ9i9r360U/SgergUXb32D2rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIQYXfpd; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso51167441fa.3;
        Tue, 25 Mar 2025 00:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742887671; x=1743492471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TlubddJC7aKC9kbsNOHXDnaBgqxpRfansLyLGsfqUc=;
        b=jIQYXfpdvlkCJGqv4WsbQS2hZELCKnN0zagXL8N1sjtlEdQqXhVQQ2YqdcpE7A/AAj
         xKJ7+stAxZVwi+phxAlvFamn+yScp8cXHmW6x6e5A/kaUp2w6+hyAaG6lowxArGi3GFy
         a9URVHxFNthxZF91iJI3BfXUmC9Xne9d0y8F0Audjf7/WeYuvqLtYmtkRjRwhDrPdjMN
         pEj2tzPhdaHKBGzJOHNwEhe4OE5ikQAswsxN9Z2GPqX3CFQ6eMwA+YXhinqhX5KyCQdG
         qh9ZntiB4Z1SJ3FFnnyHSAKTxp3VATcpzqqyvzsHP9OCQAd7Xg+o58hci5O8KZsm59Sb
         74zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742887671; x=1743492471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TlubddJC7aKC9kbsNOHXDnaBgqxpRfansLyLGsfqUc=;
        b=a/NHt6sDMwNnqDobcbuTdoCqigXaOa8adPOmu2oyPxdoBxrjIJbZsXxZxlwr/NbGhl
         sImuBTnxh1O3JLkd3z9CSXNQTmMNCQCYVtjXpl/abhEPKB47xuPFQ5ssrZkAOnV0QzMC
         WOYzGDIYjOUcCtzZHdoNUunVlhDuPr1IOqrFqgJly+MmCG0ZZH2f4HB+um/+QBwAeeys
         y5GagRP9bp6Pxwxu/oUEGAUEpk8Gabq87TMSnMuAQ/8MIxziOm/jrD6lSRzVBw7vyzmb
         908kf+ZEPTV/dl+w6xION9hA57YTLNf3mKFwITyIm8l52CgIESOuWeHarIvPdz9PWH3Y
         zHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjLoIz1PfirL2G3KjcFqUEQjEdsi3Y/WqOpVEpmnAkb3Cy2seqKReN6/Ovb2HtUC6fLq1S8PlLheaYzW8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywon00wHNcGd6y9iqS+20BOP02cm0mZwNQLedddKBnUzJBjXa1H
	UU3AYEnPBy0PdqZiGyM1jcN3ko+fCsky2xTFxiYe5p5o1wRYycDO
X-Gm-Gg: ASbGncvoPAqmwCxxxBX/2nroyNhnMGZbJUngdEwMd7A8VTrLo+valMPkR0ME7LCsStt
	CE4Ciou2At2ms00rcq/BJ/Pur7dT2+CUKAYIuNE1AInLYRx9UhQvnQsnLnvTcHXl58llBagabGR
	/lIq9O6y4OM+p4S6ADU5P0irMhfKWgYmDvPhqM7hdJvJqwtBt/uVGUb7nHYd2kQqWvT0phAyDHo
	/MbltRHKp4PwOTVEavPG1vnbWMxZ6+DOk5Bp8QSbRy5B6/W1grtkqeidHgvnHYBW/WFZbqBHMZO
	SfkkWp58b7FZkTiTeJM3IuzE4Xpha15rCi6LIBb3eJ8RKnktqiB4epb4xBNMZDrjNcF7iZEq3qH
	K6lduOBNRp4bw
X-Google-Smtp-Source: AGHT+IHBazGgEbs5nPeu5DJAYLFlO5+O6BeSSpspOCZECa2LWhi/sIsTm67Vr8xk509H6r5UPCBk3A==
X-Received: by 2002:a2e:9087:0:b0:30b:f924:357c with SMTP id 38308e7fff4ca-30d7e223dd1mr51735341fa.15.1742887670928;
        Tue, 25 Mar 2025 00:27:50 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d89661aa3sm14307621fa.31.2025.03.25.00.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 00:27:49 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 25 Mar 2025 08:27:14 +0100
Subject: [PATCH v2 3/4] watchdog: da9052_wdt: do not disable wdt during
 probe
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-da9052-fixes-v2-3-bfac3f07b4a4@gmail.com>
References: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
In-Reply-To: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=9/EAEv5asPM55GhtBdL4KSWn8n4jP3zQOqSm7mRMI+A=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn4lrff3yD91KYR28hnH9rV5tLL3ho7A2lBgmoD
 9dxNNH7mNaJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+Ja3wAKCRCIgE5vWV1S
 MldeEADdBLnVAAzhsCbbFyjjV/MOUVwdH1zizw01ypekYaQB3JoEtmMQVlbNIVBF+RhR/KQwsGE
 Mk7x4g+9S/4AnyiM53xbw7RLTPteLQMxuVcnrgyrjSrpWV+edeCCWMLUnMCnehQNPLBnbbvWhui
 ihXcS8G78erg1MU++BE4Tf4T9gpBbLvOqVlJw6jJh7UHizLOr/MqQyXjvA8SNSnxy+uCCjAqvA0
 NQ0ZzEUcSjFa5m8njcQWwS1OAipoLiJLiSadTnOXK4LD36FMUNlPbTUUleIMH8+mSyP8lOP9y5K
 kEtE6tX2cusB/tyTbB/EoLmaKOrvm9+EVkcMWfchdQiRh8TqaPpWW7xSIlEqimtYngyJMVKF4qs
 ZBLFxNGDgDa4ABAE5chtJJ8Inq0GomOO8jYOHc2IuyUlNZuM8QU68GNRMn4SNiqd0rSY035R0kW
 nKaizA6/IFtG2VYLBn1InjsIkl+2P5DbjuzSiLzru4uQul3e6j7BnIR6YdIhBj5hcU6PkYlCExE
 LlDBlKTysGIXHHp6l1Omak1oXFb07FPS6Dl0LUllfoOcu2x3IFJzzjaWo7Ds+sbypspaz87aTxM
 d4/Xd4qIKF54gab2X+xUX4mqR+yns0S7pDIwILB2y6b0shhWQEIYa7UXiVuCENeRdrROqWB9ZbZ
 YTJg8UQ+ObnFZHA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

If the watchog is started by the bootloader, we do not want the watchdog
to be disabled.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index fa9078d4c136a52f1193768fe93dc04189519679..b821006fca70480bf3b23a62bded4e66851a537e 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -170,7 +170,6 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	struct da9052 *da9052 = dev_get_drvdata(dev->parent);
 	struct da9052_wdt_data *driver_data;
 	struct watchdog_device *da9052_wdt;
-	int ret;
 
 	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
 	if (!driver_data)
@@ -194,13 +193,6 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	if (da9052->fault_log & DA9052_FAULTLOG_VDDFAULT)
 		da9052_wdt->bootstatus |= WDIOF_POWERUNDER;
 
-	ret = da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
-				DA9052_CONTROLD_TWDSCALE, 0);
-	if (ret < 0) {
-		dev_err(dev, "Failed to disable watchdog bits, %d\n", ret);
-		return ret;
-	}
-
 	return devm_watchdog_register_device(dev, &driver_data->wdt);
 }
 

-- 
2.48.1


