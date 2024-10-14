Return-Path: <linux-watchdog+bounces-2206-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D9C99C617
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 11:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5A8A287635
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 09:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91102158533;
	Mon, 14 Oct 2024 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="z+gSkTf2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEEB15667B;
	Mon, 14 Oct 2024 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898917; cv=none; b=Qu9ogz4P4SVj3vZnTwFjLU8uq5cMIXcX4DzegI1OUmAFkDX1pL8JmlBo7BJWAKSWNR4MG0tThU5RgWsTYQwSMXwE2HOt713OS+MDhZ//v49GrCRCclZ/3bDiw+hLLWx9aH6aqubXbmJpujprbX7cEvI8vm2GG8N86JNErarQZ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898917; c=relaxed/simple;
	bh=phfhIlkxTT9xrD8E6AoIkVoylrf5p8GljqqYIKT0cq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZNy/uUpdn9UkFJyEg0VmbUNHIQT5HQ2j/wVU3yT7Fi5mnhhbAsXa8NyhFJSPni1rCLGP1+S+vcjqg+92Lhf/ccrFPl2rA9htZOpDrsXZeco7LjU6hscx7Yy0rnF5tiQ7oaz/xjIXeCwEBfxNzSD5lGp5t2jGtmzahYfMHtci2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=z+gSkTf2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iHN7rgSjPenH+vCGZM1JTLgFjmcGkUfCBE1SIYa6l8w=; b=z+gSkTf2njvXu5QkfEBmObXdGo
	0MsZ1wI3A8dBKeOIg+lzjiwpOOoX1q3luvUHg7zKh3fzL13tVXAZ931mZa8jcNCLKHhOgtCfErv3W
	nP0LrinCDZRV4tVPo6Iks+s9KlaS0/+u5K56X6aYXEPgDb0c1Z6lmP2AlT4ANPUbGKH9+pMreMlbd
	TRtfVxH55xOEiAQtn/jCmFjYMSwlML5yfLlj4My8400S12QqczrSRkC2nERFmxBfssfBHud+OzToy
	pBC7EAoUK/tLLCqp/N6yzwE2muERnmjolfs5Zr9OfhjaBwzoN/ZPaoc84jiHxD5dnlxUok2y81NEc
	DWhVak0w==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t0Ha4-0006uK-Vp; Mon, 14 Oct 2024 11:41:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: wim@linux-watchdog.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	Karthikeyan Krishnasamy <karthikeyan@linumiz.com>,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/1] Add RV1126 compatible watchdog string
Date: Mon, 14 Oct 2024 11:41:33 +0200
Message-ID: <172889888553.115816.1681267326327855067.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010061408.1351865-1-karthikeyan@linumiz.com>
References: <20241010061408.1351865-1-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 10 Oct 2024 11:44:07 +0530, Karthikeyan Krishnasamy wrote:
> This patch is introduces a watchdog compatible string for rockchip's
> RV1126. I have already send this patch[1] in the series[2] but somehow
> missed watchdog maintainers and list. So resending this patch alone
> again from the series[2].
> 
> 

Applied, thanks!

[1/1] dt-bindings: watchdog: rockchip: Add rockchip,rv1126-wdt string
      commit: 39579b8c8f9e6aba5b299d0309c4a411688b60b9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

