Return-Path: <linux-watchdog+bounces-2421-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C07789BE92A
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 13:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 789A91F22E02
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 12:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D6D198E96;
	Wed,  6 Nov 2024 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XEqlfwZ3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A689171C9;
	Wed,  6 Nov 2024 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730896273; cv=none; b=WmJAy7Q7fQm6WAIoecMxvbmorHWu9fScFHXhJKPKYcSSbyy/lKTZ/GSakKSOUVyKiOQ2GHUBUX7cb/KF2E4g832DKwMn8Vy7Oxf8GnPBxk1sDpa3q/jczU3CM8PXyA20S8oPx8llnaFXvaJxpuTxuW/dd3Q/V+CktpoKcAwiuCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730896273; c=relaxed/simple;
	bh=LVZC9YpZah6uXDvJdeHUW9uz3cIFHxVPayrxERGQ/I0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vbglyn7Z2N23aR3UeEjstX2oTbGFD1vS8rWGABX637qO5QFlRwQVJJ3elK81Ju1CDq7g1eoFLQR1NCVe38KboaNOtTp4JIlgFyOF3XRolnGkArAhw2yTRgO7W9R4uBbE25C6mcmRYHaCgsHdVFsssM6PLa/lBzzard6Q/KN7N54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XEqlfwZ3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730896269;
	bh=LVZC9YpZah6uXDvJdeHUW9uz3cIFHxVPayrxERGQ/I0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XEqlfwZ35IDW+CM5840xi/LD0qYJrHKIGHuIVbIsTh6Sw52PI1eiH8Es99IGl8rhy
	 u43JHdoQEQyTpfylBX+9WGP35+zI9XUgVHgak+iPomNEL0ZDR0CEes4N5+tQxfUHHY
	 h2QrXuYVoTj+tmZd+WWWBOnAKh7suJNA85m2ssCek89nraACcwbsXmsi3Z6e+USA3L
	 DUkBqk9JFYKgmqcddpKHTBlrH7BeqqRpN5lhhyDb7Rl1sci4sZ5TlvAU4lTUYrHsYp
	 yXdNEN2AfuU9d10dIAVuI18Sdw7Gyv0WRW/2vjfJIKQyBsU1/3NkwPrVT8DsTZUvlD
	 xpbFEKjrlg/xQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DA0517E3626;
	Wed,  6 Nov 2024 13:31:09 +0100 (CET)
Message-ID: <8f07284d-f5c8-4de3-85d8-ef87e58842d5@collabora.com>
Date: Wed, 6 Nov 2024 13:31:08 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] watchdog: mediatek: Add support for MT6735
 TOPRGU/WDT
To: Yassine Oudjana <y.oudjana@protonmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
 <20241106104738.195968-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106104738.195968-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/11/24 11:47, Yassine Oudjana ha scritto:
> Add support for the Top Reset Generation Unit/Watchdog Timer found on
> MT6735.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


