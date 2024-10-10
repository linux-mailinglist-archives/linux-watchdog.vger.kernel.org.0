Return-Path: <linux-watchdog+bounces-2157-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE416997CE3
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 08:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92FF71F21297
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 06:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEBF1A01BE;
	Thu, 10 Oct 2024 06:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="G3VESp9x"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0AC19DFAB
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728540894; cv=none; b=UA9yzzJhfu2hBI2FIv8WpcrLqM7psE/bTtjepR7Hkbo8Uqyvxw+Ed418qqhhD8BPnDqrLNCVEZy67+M+AUJc1hOq+ejZsuMAS1pHcI52tNd7cuDdcIY7K1A34bDH5a+hGlKoe+4CCm5nIqe/fObRnWSM8zE9kO5jO7Ycz0qFirQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728540894; c=relaxed/simple;
	bh=cn5vK56jOcjlo9XJzP5uTQcE5ndRjUdaHxqRUbU1430=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ug2G2emRUyEnQcIZEPOWC65ljWmb0vwGyardtzVzhN42/z+3OReGvkbd9eL64LGRxu9ej8OpJSsgdMYagbxe6qUO+60P6IrWurxaAlLjUTHFlnG4WI8icBuizlQVMEt04VkKq2piBcRZFipV3r5oUNcjuIGgZ6rWOMVAoitabcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=G3VESp9x; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
	by cmsmtp with ESMTPS
	id ylA7sZskuqvuoymRnsoMo9; Thu, 10 Oct 2024 06:14:52 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id ymRkshAna827nymRlsxEyO; Thu, 10 Oct 2024 06:14:50 +0000
X-Authority-Analysis: v=2.4 cv=GeTcnhXL c=1 sm=1 tr=0 ts=670770da
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=DAUX931o1VcA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8 a=VwQbUJbxAAAA:8
 a=CWmjl8rzmKzYHtF8YhwA:9 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=u9n22b7xqMqkSOr8GxS5T3m6uq+qCh+LjINZHSI03K4=; b=G3VESp9xxKglmfRxhSHl5KZ1Yt
	uZifip06lQ2SBcofq6IZpS8OtgTb7qlA/HSPm8/DOVxwm/DkZ1IQgJW4O5XNC2bII+rv5M1Aa760e
	NAW1hy+FZpVHLEcakSFVk6dYrv6EqzDbKh/iMv1nSubfWt/jZa9LAFWJmGUM0rLiknpc6T2ABYIj2
	s9FNzpFwErmEgXiRTgOlL8oZ8KX+qcH409uenFQcWJhhxKLLlm3qGJYpl5kb+U9jvzk0hrsRAhrMe
	ewE2mL1b3tBAAL03t3OoIrdLuTPprc3PSSsLceXBVi+y+HE0jjpSEPw08Xcj9hslNEuhnsDmLbJAg
	8DuQN2eg==;
Received: from [122.165.245.213] (port=36152 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1symRi-001l4I-25;
	Thu, 10 Oct 2024 11:44:46 +0530
From: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Subject: [PATCH 0/1] Add RV1126 compatible watchdog string
Date: Thu, 10 Oct 2024 11:44:07 +0530
Message-Id: <20241010061408.1351865-1-karthikeyan@linumiz.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1symRi-001l4I-25
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:36152
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 4
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLJC7w1FyCUC4nkJ4eSZdwDnf5MDWXjscdGAeDqQpiwRYAQEr77B74wXl3CanBrmAc/9X+GfWRjJ92uLQp8chQMqHHQWBiSUZgpm9pvVq31mmkcER9GE
 rxT5nfTfUWxFCpgT+2UbZRfCeRvdmBmk1SSJDqTGyEXm6q5I/vuAHmH2YEK1Bso7STwAiCltRaIS0eFNzXg4v0On1WMkfQnlWEnNzzc+w+ScwS6ci6P/Fb8/

This patch is introduces a watchdog compatible string for rockchip's
RV1126. I have already send this patch[1] in the series[2] but somehow
missed watchdog maintainers and list. So resending this patch alone
again from the series[2].

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---

- Link to patch: [1]. https://lore.kernel.org/all/20240912142451.2952633-2-karthikeyan@linumiz.com 
- Link to series: [2]. https://lore.kernel.org/all/20240912142451.2952633-1-karthikeyan@linumiz.com

Karthikeyan Krishnasamy (1):
  dt-bindings: watchdog: rockchip: Add rockchip,rv1126-wdt string

 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

-- 
2.39.2


