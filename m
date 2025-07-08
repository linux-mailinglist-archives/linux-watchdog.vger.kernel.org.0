Return-Path: <linux-watchdog+bounces-3841-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B5AFC60B
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 10:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D4C81894863
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 08:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854972BE63F;
	Tue,  8 Jul 2025 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kojm2K8s"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A2018A6C4;
	Tue,  8 Jul 2025 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751964257; cv=none; b=liRZSLsV+5pzsnhYhdiGd8lrYqe/9raMSq6RDwL7D6hcq8lKAyr3HwQ/Fa1G9ASMckDKG3M7M+lQPIeYqXM5x+srQnlXaZk9B+xkJTlwHIomjlNOaWlYh6rYZxf5CCWUbQiFKdQ7zSEE60799ROzVKlgfs7RwZ9lqCNLCSZfSg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751964257; c=relaxed/simple;
	bh=7qiNC+yf9eJ5O6aMil6afPWYh5EWFpuGHBB+T4HRaHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAxnA2P9LvOd+6lFVt34DtOdTz0t9lTjnR4DxIpIGmcImXom9pJYUNXgj+Dswaeq/XjPo1T+VQ73FfycpjngP1Elgp0ced3T8OMqFJ2HbwpSKaDKflUwYbRUWRRk9iOjL+/aofZcXDdEDT7omB7pene2KRDdMs4Gy/D0shqB/fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kojm2K8s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75519C4CEF1;
	Tue,  8 Jul 2025 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751964257;
	bh=7qiNC+yf9eJ5O6aMil6afPWYh5EWFpuGHBB+T4HRaHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kojm2K8sadJqZwidW0D255pG4egrPRco+NwIZwN2JQUuQmmZxqqurYiGaC6Tq0U3D
	 uEYguXM5hD5YlAIRH+P3vN7Soh3TH7YqSfMuhBGISKIpiIk9CbXs+K7UpEvuMhNV1V
	 7KeWZEakTIgt5GSKQ7ATYRDoGYQWUwmp2ZCFWzgc3VE5CHpyxHGCQfGD4kygE3ypbN
	 LCjQScINAi4Dmr5TV4sgDYG1ZTqnjMOgO0mPJN0wqZ3HlEX9rIM+LjP4CvENXSXpGa
	 VIhM0k4oY0ZM64mx682efn1r77iyV5dPx2zb2O1dczyYIvKXDPlZjYF/u0nQ78j/Al
	 oIQ0yzw+T/5Pg==
Date: Tue, 8 Jul 2025 10:44:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zexin Wang <ot_zexin.wang@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] watchdog: mediatek: Add compatible for MT8189
Message-ID: <20250708-devious-pug-of-kindness-4f8dfb@krzk-bin>
References: <20250627094431.11772-1-ot_zexin.wang@mediatek.com>
 <20250627094431.11772-2-ot_zexin.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627094431.11772-2-ot_zexin.wang@mediatek.com>

On Fri, Jun 27, 2025 at 05:44:19PM +0800, Zexin Wang wrote:
> Add compatible string for watchdog driver on MT8189 SoC.
> 
> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
> ---
>  drivers/watchdog/mtk_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 91d110646e16..ae61e7654e8f 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -501,6 +501,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
>  	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
> +	{ .compatible = "mediatek,mt8189-wdt" },

Redundant commit, really, a least with that hardware description as in
commit msg.

Best regards,
Krzysztof


