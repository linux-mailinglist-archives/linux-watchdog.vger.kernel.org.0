Return-Path: <linux-watchdog+bounces-11-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 550347F2A7C
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Nov 2023 11:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F7B3282282
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Nov 2023 10:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33A22D60C;
	Tue, 21 Nov 2023 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Q9F9dqLS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AADBA;
	Tue, 21 Nov 2023 02:34:52 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A27966072F1;
	Tue, 21 Nov 2023 10:34:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700562891;
	bh=qGOFfzHTmwNO8RaarKDI1R8ZcBkTKNwdJlZZMnC9tRI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Q9F9dqLSfls32qYiEb/6t/KTwMWLSUbv+68gYPu2dFnWkfDDctkW6vo/ZdW0ZlTUI
	 qxORoz/OpTPeH9gC/5pTn44Jop8VEogD2yaqTqx4cw4VPNDdlpwX1RvQpk8VBoufmC
	 X/c0wIzux+HzAzFnTDUKY0WTR31p6nczGnHyacxzo6p/86eyyAl9bz1u78Bef885LQ
	 /cTJFSJ64byVuIEQLNfxvK+JG+At7xN/gCtgMYC86zj3wm4NCYpusd2erhMFp5+eG1
	 bwJU64PNkz+qRgIxdyBqgxhGJfjpp6Um+CunVgX2zuxYAe3lkY7ksdJ+xmZl7N4G07
	 65H69uQ4DnLBQ==
Message-ID: <88b34ca9-97e6-4a62-bcd8-19f3f3917d8d@collabora.com>
Date: Tue, 21 Nov 2023 11:34:47 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] watchdog: mediatek: mt7988: add wdt support
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <6478f8d2af59736d23a96b52891bb541de33870d.1700504385.git.daniel@makrotopia.org>
 <c0cf5f701801cce60470853fa15f1d9dced78c4f.1700504385.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c0cf5f701801cce60470853fa15f1d9dced78c4f.1700504385.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/11/23 19:22, Daniel Golle ha scritto:
> Add support for watchdog and reset generator unit of the MediaTek
> MT7988 SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



