Return-Path: <linux-watchdog+bounces-3821-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2D4AFB067
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 11:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 657841619A3
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 09:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270A428934E;
	Mon,  7 Jul 2025 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AfUibJVB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751B01DF256
	for <linux-watchdog@vger.kernel.org>; Mon,  7 Jul 2025 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882067; cv=none; b=msHXBR812bbCujGx/kwG15RWpwgH9x8ixMYmmghw45FgS5KM+vdrWCbOyx5A96hIG6PnriMhchI7LBEPprFALQyDdZbN7SCLew5vMgtJU9HN+z5a6eU+sSTvfKVhA6rrW3Jm4uSi05+N3TxiAhNuzbbECjXX/iy8jOC35lzh4Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882067; c=relaxed/simple;
	bh=PMctWqdSUwyJh+vgKsEE3Z5HNCwNGQH1LRJi+dlS/aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ag1Ct/VmcbhJ/pp6pIUn9XdKzjXwsM4X2ttKurKueIC5F9UyMM8xFu1Ln/AOoBFwdBT6Hj5hMl7SWqlSPbh/0wWjEI1EXlE3OeQHYPRl7G/J83rdPVPfRmXbNtSrex26Hmk8utt79YU5EYiXtAxS9TQgvq45fKCa3jueKKuiuVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AfUibJVB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso25001525e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 07 Jul 2025 02:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751882063; x=1752486863; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WCkV6gDGOoOMF8igB/5H1As4Qg7c4viJIZ8RBw36e10=;
        b=AfUibJVBFIalQoFvAY+0wZdvcNMIJ6yijMzrnKhoO7uWtfTm4X+aIo8mzrUXN0dtnZ
         FPZxweitmEr7ZOUxnFEcu6Z/eK0ycSs8/MrluOjNRp3l8Bn+WzfRPwFotVIAonMpkdIb
         MrcJ8dLcv15/p9VsYjLoSup24sdxKFMPkw1NMPHtMxYXSJswRuWnNer8LHcyrijdHEcl
         ha6qCgJ0xHkuClyib65oy0SOQjg5rFySXfQyimPsvS/PWxvZMpsXIr8ZxBY+oZ5YAWEn
         paFUyhr8cqKTdTQOYHf45onAIfnGbtq+zfdCcz3yxRPI4oh0zDBlSy9z+Vo82v+7wU4i
         CU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882063; x=1752486863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCkV6gDGOoOMF8igB/5H1As4Qg7c4viJIZ8RBw36e10=;
        b=w1+jWN5qcFAxgwapm1FgJUvwgUK/M52uvQ7tBR90oTtKWT/cDWiLNlbk0oGjY62eDB
         zxaenSZM5NELLApNumluoJgdqlLvr4yoc36IMAGsETqevcbQWE4iZvril9vu0yI5ioAX
         JRXjJ9tydT6uU8A2sTO0Brg9T1pUNatn9H6og33qaKOmZZkLJ5wMMl15Jdaj+y9FCFnh
         6wwNG9FulxjjjRfgkPF1MiTb6HaiQMc4B39SrYgaEwFYiCt00d/n9CO4A+BKaeYVMDhm
         f2qZvLgDYxjILgpzY3BecSjSmRHNmxl8uerJvSlkIsXYI1Nmqptr9YOAZOIAKL8+fcV3
         CudA==
X-Forwarded-Encrypted: i=1; AJvYcCXCqCoy6p0JdS8J9wYI7GZdpUkbJEKNt73qjaSBYoPr1EGcQSxkudOVdxPqhNEQ5RwJm9GEQEAVcZzmngylvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnudCCnQbYS6CJoffytXSXH9ouakb1iJBZFPyj2VY8f9JbWd7N
	Rwk7hfU0qxDJJolTHlfUgDsG/G//LqTd6v7sDLTi3SHsvaOSlCxsApRgdYm/f7+bp8w=
X-Gm-Gg: ASbGncsTGuq2jv0RCcTPH7GkgYYlOMnpPgxve7OzK78UQvdi8rCvRGn0e1JkOd0MyEe
	kIfKhfXU/T20p0i2In+A677lsCYg3U3blJewyK+QomrzHkxPy7yiNAQd4rJs/NhslridskIDWCQ
	k9ZZE4nmuiHiSLbK4ROrgeUp7Wznpd6Ot1OwVqiFfcrGdPPWK+PJRXhFfEq5SlzmJSrybx9oKTg
	bW8MTNstyETwuu4bXXDN5iyMQhy9JCcgPG1kF5CIjTmAiZLQGDdR2nq1D9KmsJrQTgBIVLLSVGc
	GBIyB+D54zNogSIVbxtKZTwrGEcYDMdmjniDBTUnAYek1lUVRSvZbyITKgDVNai3RruQPNumyBQ
	wyjvOOfpywm2u4KNnYMtlOluu
X-Google-Smtp-Source: AGHT+IGNA0zQonP2czf5X1Jge+pwADtgl7Io7cV8JOwQeqN86Oye2fUbW6LvrQW+jILiqb5VBqE7Pg==
X-Received: by 2002:a05:600c:45cf:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-454b4eb7f3bmr96048435e9.25.1751882062707;
        Mon, 07 Jul 2025 02:54:22 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a1705ed5sm89436555e9.2.2025.07.07.02.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:54:22 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:54:20 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wctrl@proton.me
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sean Wang <sean.wang@mediatek.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 03/11] dt-bindings: timer: mediatek: add MT6572
Message-ID: <aGuZTIP3vo9q7MMV@mai.linaro.org>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
 <20250702-mt6572-v4-3-bde75b7ed445@proton.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702-mt6572-v4-3-bde75b7ed445@proton.me>

On Wed, Jul 02, 2025 at 01:50:40PM +0300, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for timer on the MT6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

