Return-Path: <linux-watchdog+bounces-2568-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCF69F1434
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 18:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCF091693DB
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 17:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF6617B50E;
	Fri, 13 Dec 2024 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdUxQ6fQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7373F41C85;
	Fri, 13 Dec 2024 17:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111929; cv=none; b=ud4xamSiw6S/GmQ6yKGWI2U6/zG0+dYA5QdhxSfs3Hz9309dB3MQDekzJc22FHeDi/TU1atHLpsoSSOwoEmISBCUugS4uE3Gzs/63W204xAJ5wf7kFNnAG0dD0Qajs0Ko3fF0FLJsJFra1DIxmvpHM83o3vVvgmRTYgZYWN+QM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111929; c=relaxed/simple;
	bh=tOYVtAj9SkLDMoTNOyJoJUdV7FYJ443zN1ZfvPQje+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nwjh1yRoIlvPIeO7DzFIUEuxSzX+yAbwgrZNwm3X+30nNfAJHb84nixVqTSWCUFki8Y4HGsh5H8kBGMdWGAURhzhvRLY+WHmpURQZa6olWtDdHqihR4mPkG2f+Fc/tx/d6nIR6pMrEa6scFr1cXRy+9CV8xIp27/5Gjrxs2W+/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdUxQ6fQ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2165cb60719so17001085ad.0;
        Fri, 13 Dec 2024 09:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734111928; x=1734716728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=egm1r1XJDI/XKyBlKdpjMaoDrO9Jq/QkyEmeYJo0sfo=;
        b=DdUxQ6fQmAijL9iEr6AW5If8acsSBgJrdY+dBtNPe4UrC3SewzbJEYsxbLs1npGfGR
         1/JRodebVbFxf6FTgL22cHAUW2rQxUKyLf3gpvZCBHr0gE6N+SjzJszLz0tKyzBZczH5
         PP3qPA0qpUI43QeYvtrVc2a4924f/mbEyx7bHi8xZohi9IW6mzxrRKOxyHoK7TfVHFru
         Wuo9+PEz06HaXBtXTfaeKmDVTYXp72rczJ8Yz36tJW8WzkltwqlvdXRh9KsglOTPlkTX
         lLhWVaa1hFzA25HmD7f5gMEBKQXleCgkX6OSpsA+0sM40JpI2DPiuntm4fUEUMnah31C
         I9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734111928; x=1734716728;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egm1r1XJDI/XKyBlKdpjMaoDrO9Jq/QkyEmeYJo0sfo=;
        b=iDccJBEYk9lLFSN8qVcb3Viq+wINQhoetMmFczdntakRfEH1ZJDuLdZejrhAL6+2U7
         dZAO0OHEl7vc4C31NFujRGcN6BgSMUe0M47N73e57e+yfYGXYkk16IDRRshJreGouR+w
         3VW5FUPXEPVV0Bj8QOPPsHYCXy70mPHyy4hCULH+p1/oDLyHAzh/Lafc78ViWvW66IRp
         OE8VRQmZ5Fkjhxt7aw5btppAO27a8ywj6bxmxksiqOhNzwg+7wqtcHu8IG1i+ZNUqOse
         c+gEzwJ9xGeq1luoTfwWH2IgM38GkEsofeI9N4MvB31HDNQEGxUyWvi1+3c6TjMavWab
         UHAA==
X-Forwarded-Encrypted: i=1; AJvYcCWnBFubF1DXEAW1pEUVt2JkaukIOMar2uGUPHvRh5YGmtrxmq2woWHi4noEzhSgDwwICHEaUA/XkWU5hJ28qRs=@vger.kernel.org, AJvYcCXO9qpUhmFBu+8ekgXD8TqNrWBzUF59G8e8U7Yu7gN50jSDzVFoMfdIqXiDaw0wdxypHqO30w9UnS+IWMWms7pcmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0yOG/QsPcVW+6Zm946Aa7LigQwU6GuVoHAho8kns0fty/XlW
	fMNvuEzneYLODCY0dOmMFxPLQWYKJe6S3VFUvpD49sJ0QsJhWk9y
X-Gm-Gg: ASbGncsEerZ47xjP7YJ/QT3uV6Os02oxy+XZKm/efjpBimrsmyZ4jMDlh5EJdEhhoKq
	mvL78z/guSEaRrpgaXTerCNaZiMFN60rnrXV8+K4Kg/rm6zv5RjEcxkHazTJVTdr4Ewf8v76zWe
	1R9pMRFAMUqDDLhg/gJrM6x7t3iLZiwp9/EAemEcrXP/5KT0vkM4bYOusFtQoD4A35Zv72IxqJT
	QBWUi872+ge3dAuRlytPviBfxea8cYM1JS1WbHdv2YWxbtarTkVe7Kdm9j8XNJyWpYsz9I1FdMK
	Fqte6dkaubz/Y860VkpLW6jzabJo7g==
X-Google-Smtp-Source: AGHT+IEROapdowhPEWpqzjxV9RLFAral9fv5zLGqgo4tBJ9S2DhhOaU82N5IHIppYgVedLSVvYesvg==
X-Received: by 2002:a17:903:22c2:b0:215:8809:b3b7 with SMTP id d9443c01a7336-2189298227cmr44388935ad.7.1734111927721;
        Fri, 13 Dec 2024 09:45:27 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e655efsm281775ad.240.2024.12.13.09.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 09:45:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f6eaf325-935c-4bf7-ad55-cd3723b3b65a@roeck-us.net>
Date: Fri, 13 Dec 2024 09:45:25 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: rzv2h_wdt: Use local `dev` pointer in probe
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241213171157.898934-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241213171157.898934-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 09:11, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the `rzv2h_wdt_probe()` function to consistently use the local
> `dev` pointer, which is already extracted from `&pdev->dev`.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


