Return-Path: <linux-watchdog+bounces-2526-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEDD9EB4CE
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 16:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A467188941F
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 15:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B881BEF81;
	Tue, 10 Dec 2024 15:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpRkEZdq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CCF1BD027;
	Tue, 10 Dec 2024 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844303; cv=none; b=bC2XATZ6Q+9k5yMr08BltfmIwdX7Zfi+yG9E2Ywy/6jkm+DsWORuJ9a4Ga+hjCqIgosCcK3J+O9z9Wm1d/bY0MX2N7CrqoeDUqwr5hbBrJCcjKBmblX7Mrxra/z7IY7rb5JQsANsz+dGN5Rel/KDTEtA1SuQEm5RB+6tyKpvHcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844303; c=relaxed/simple;
	bh=KOVOlblywcXf1ck7MFmrsbSCzQiKxUv/iFiuBA8+7uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FaPyFBY+ZxZLexdJUavBgc3q9bPJiU5EIoZ2GD7NR3FX/UxMr+rt0x0KZ2eVIYRtz/eajzkRjjIvV2m9XSlMZwIejdipt1teoAO++H+2xFrS3iVN53ex8MpuoteIVDD7J07Mj/qNdU/Acld/1IQl4F0+PKxBWreoirAgSl181F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpRkEZdq; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30039432861so39882131fa.2;
        Tue, 10 Dec 2024 07:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733844300; x=1734449100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3wGnwth766NxBXNweuZ4eboEP6C3m+thZTRCcL2+fU=;
        b=mpRkEZdqijkD4jTxEH6IitkYJVQmgOc2CDM0e/dgQZfNlgopkhg/ChBaaHuoeCvbZV
         luH+QA7qEtD7VNgD4lGiVRqWZZ+QIimyX/hTtcVysT1DNmNyB2cgN+wAaaqwwlzLCRy9
         dzsgxLaAB41jM71F7WISHRFGz7T6KfCatMRAXmPonnUqTJTGnjxaudCUntYUXA8ezsgZ
         vduRT81J4WaE8OPwN6IxRARkwsChvg9lBQdAHvYFGMhnJrBDqAUWTEXSs6u1KukK+GbV
         e2VZSdkSw4kYACkx9ELWpgNU6Aof13rE/ZLaI6hIVErZfNeyXYiBmRPuieeNlfBl7iEi
         MBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844300; x=1734449100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3wGnwth766NxBXNweuZ4eboEP6C3m+thZTRCcL2+fU=;
        b=dUZR5j0mdHy4WBEC+dss/gBCqA5jWr7B+4abvIsitZ/3u1KSuUa/+2vCZEq56tnybQ
         P362SSoN2NVqTectLv8i55CzRtfkHXJA3a1in+v1xgec5nLcWXnj3Rg8XDhtenDJ6w3W
         qhHPdx24URd8pl6LCdlxUtd3ZmbLfMgrzYihUDQHKksTxvBO9zEiBY4xEc9NERGTVm3b
         L/ICZRCqH9hxTfhZd5zUDz/bpqSPjTUavJUQxHq3CO8hoebpTMWRgpolW5frPOAuv1w8
         YZOaNi8gzb7JdQ3YzFaBgyAaNzfQq7Xoo0o65qxmpLJwB+cRQbYaAQqdRf9/46xLH3Sh
         KCpA==
X-Forwarded-Encrypted: i=1; AJvYcCV+gRpneO3PrGZEE3q4VqnG2x6tqUhCiY4q/L8/XThRJo81xAeTxPdgnJcVB48obbOGA14DDI/lZrA271qhig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO1wcpHU3O1LBQuv59XNQb8xeUURDlR1S7GeaHk5cERoPz9UU9
	LrD2ud+yCFaPg0F/jsXzIPVZznzrpsmS7SnvHMg8pjlmdUWHwh3j
X-Gm-Gg: ASbGncuyc8GTcceQrVyxTWOE01oqh9GkhWliD16WiyOXg7dWiBZPxY+MCGNHZv3nC9Z
	pIkzIo/e1zNjrZllA1b6DYscHxSmsFZEE32kzcz1uXOtmZf6n5XFovgsQ31BHtHiGX4mLemM+5+
	/nh1GRCPA+xqIlWd/tqbvO575/fKogz3ILGHQBmksnHoRNBM9nUGrqeR5NtEhaLjbxQIgb92/Zc
	3CmP6BCn3O7bGlCQh+R0No3aVFdlET2Q8n43IDpVhz1wo1C86ywgGAFKVRTDzzadMF1Y5azuMhP
	SStnge4kWgDpqN8n+Ic=
X-Google-Smtp-Source: AGHT+IGXgsxDxw+M8p4QDgJRWjptU/KdJkc5N4d31c4TJvmQVWuM8G9bRz/5ftVBXJDmCjrKgPSaBw==
X-Received: by 2002:a05:6512:238a:b0:53e:39ed:85e6 with SMTP id 2adb3069b0e04-540240e3457mr2120021e87.32.1733844299468;
        Tue, 10 Dec 2024 07:24:59 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e39375d36sm1254397e87.7.2024.12.10.07.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:24:58 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 10 Dec 2024 16:24:40 +0100
Subject: [PATCH v2 1/2] mfd: da9052: store result from fault_log
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-da9052-wdt-v2-1-95a5756e9ac8@gmail.com>
References: <20241210-da9052-wdt-v2-0-95a5756e9ac8@gmail.com>
In-Reply-To: <20241210-da9052-wdt-v2-0-95a5756e9ac8@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=KOVOlblywcXf1ck7MFmrsbSCzQiKxUv/iFiuBA8+7uk=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnWF0+ei+c79021eSO93DFtwQD8WkL1nMB769tx
 VVXetcpjJaJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1hdPgAKCRCIgE5vWV1S
 MumcD/9Zvf7bBL0KpXpwpVmAp/9LFFOEcsogt2pzReXJMlORInoDSdbULjb50PUf4HtPBYMB3nj
 vtOdM6Xnl3PI4Dz9ejHuig542jNrlCrodd9DmkNouOIzs5aEK01/bIW23xo/1HR7BrV5st2TaJu
 j8+vmoogefCQBeM1M1+CZkiphZUiT7syagRTF7/kEorO/Ba0jq3GMQCMSNV6uVzBjUj5QTaDQb3
 U1KLJ/F9iIDwkFfKWkDh4PwPQM3EFmiw7aeK5uyH5HYEElOKLIsdD2Ir1tDhDeNZt0pWuDRJVQK
 sFUTvbqkMP5G+U/6qVU9va5e2njz1YWutY6FEUAq6geyjSNCS9Kg3ZXagFKA069eUO3WCOZgMZi
 wck5eciVSF9A9sZTjbr7l5pf1rB8/at1CS+AOj1lycniheTUTuSnldCJRcIlqF6oFgiXYJdl/Ay
 ox6lHrru8YVt6+2M1OhpOgAxewb7Rr4tWuANaNyu/Ks1S9wgiB+AQ6PSYTSq4/3c8BA1Jt0RoWy
 fS3xr3XcLDqVuiZgGfwq2CxFzyBtEGgCuEEOcYG2rIFZKmiu/ckF85JlZzeDA81/SI47oZnlphF
 f8Kg56S3Gi4gy0KZf4c0rfU9UgLTKjJjxZH34Y/Kq8Ld8FxupDKBBPmw4rdvgbYVqyvgbXGXIzd
 4Ctpcy4aEfhK6NQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Other sub-components (da9052-wdt) could use the result to determine
reboot cause.
Expose the result by make it part of the da9052 structure.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/mfd/da9052-core.c         | 1 +
 include/linux/mfd/da9052/da9052.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/mfd/da9052-core.c b/drivers/mfd/da9052-core.c
index dc85801b9fa0850fe4dbc351014b7f2981460f02..b06cd518413bffd2e330fb81f8fbbb85c3cf40b9 100644
--- a/drivers/mfd/da9052-core.c
+++ b/drivers/mfd/da9052-core.c
@@ -585,6 +585,7 @@ static int da9052_clear_fault_log(struct da9052 *da9052)
 				"Cannot reset FAULT_LOG values %d\n", ret);
 	}
 
+	da9052->fault_log = fault_log;
 	return ret;
 }
 
diff --git a/include/linux/mfd/da9052/da9052.h b/include/linux/mfd/da9052/da9052.h
index 76feb3a7066dd4ea2f7768794b8920f67726b211..9cb2fc2938cecf6ddb76da401ae3a098525c380e 100644
--- a/include/linux/mfd/da9052/da9052.h
+++ b/include/linux/mfd/da9052/da9052.h
@@ -93,6 +93,8 @@ struct da9052 {
 
 	int chip_irq;
 
+	int fault_log;
+
 	/* SOC I/O transfer related fixes for DA9052/53 */
 	int (*fix_io) (struct da9052 *da9052, unsigned char reg);
 };

-- 
2.47.0


