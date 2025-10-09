Return-Path: <linux-watchdog+bounces-4369-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385C5BC92DB
	for <lists+linux-watchdog@lfdr.de>; Thu, 09 Oct 2025 15:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E64463E39B4
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Oct 2025 13:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FA12DCC04;
	Thu,  9 Oct 2025 13:05:15 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D2F2D77FF
	for <linux-watchdog@vger.kernel.org>; Thu,  9 Oct 2025 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015115; cv=none; b=CcftVrBHnrMsvb/E8HzfTLHjeg6x2ML0D6xqJ4wiexkrlNuqb3EkbgYmVaNOrJuDccrFelozJHDalmIf8wOYWFpydTMBgDz4ODY9eirRIwyL29J8lYrfKayLHimbzl2LNarMA+H8cLGiUiCDRI67hY+vb2bJS/xgR9jb3e7qTxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015115; c=relaxed/simple;
	bh=xD6NRTXf9K2gq7W3hAHzUvosh1ygHLtSYWKi0Ow6kC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJoQ/geS7jTdUznZoTTeMmvKcN5UgIf0p36jFy36fdmDENqn4TBSs/Kg+FfoXMhoF5Ylr02QhM/0b8btPqY/xzYjUBZkKogfWXpr3WF8StqSxvY8pfdqwxoD+hZY9lrfOEYYIytT5YlLvbpasLJ+QNu59tCwG3NLmMQyHR61kpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5b62ab6687dso1011427137.0
        for <linux-watchdog@vger.kernel.org>; Thu, 09 Oct 2025 06:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015113; x=1760619913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVdYrb04OGpyzIab7Gx3IKAauwKdWRH6vKgRJNRIq/Q=;
        b=IpI1EIJBDgnKmGH3/BuAOOjpSCnBk3y1wU5b/nVvO5hIBSpqNVB0kZ9HlMsyETKc8v
         zZZRrqxb4TDkweTuxxSWqqUTHD252XuZ0URQwaEDOGTIjYQFVVdwEN46WKDrxA7sd9/v
         DS8aiZygEH8MHxGu+P/2gJTQuXkvuNk9eApFt6sYvMlBiANg+g/iUWG5XfoyKyENxEjG
         MvNYYQUzZgSy44Ll6TA4t4J4bnf/feyRKoPlIbUiec2BIE0M4SE3eyINtVhtMLhTsb3T
         gwQ+VHmg/XgNsIIAoKeI9aJyirRkDVYzL9wH44nSJD5ImLm7QrZJ9PyWzsbNhkn8vZ5Z
         FhIg==
X-Forwarded-Encrypted: i=1; AJvYcCVCKZhhBEYzCkJpCdUpTBPTIc2lMS0eRlhMZ7UVJ1GZ1IpOrtoIaAY07qzDnQ0V7tKCvg6DbnZHKhcTHtEKrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1YQw0wlsGVYlf/i9w9iVOoj6gifHduMy/pKOqgD535gFky8w3
	eBw1EQt5uDSJw6jCEH/I37iXWQKmtX/ZqrQMJQxqKE7qKRHyLEHEeQggqxcw9peN
X-Gm-Gg: ASbGncuQHw9KAmDPWwYcZ/hG4noYV21P/dvQjVxliALGASPDip2MVxiQHMhHYNpGyin
	DKbfIl9dcbRcIpwjO2TeuhjGj4EdYQIJti5vrPV9uo+x4Z79/3kKBkHTDi7HRlyH4NA6PPnfVIB
	XpmIVlaEfMAMQzn9j42LCY7DSk4bobSJbe/DUnJS7RVgY84p8yHND7lH0OLsLsjbOMLvOSnZxlQ
	P50Jdh1/ANijrkAlI9BKIh4Uy7V69PtfjlPlXxhwR5DYnF8/hwqHjHSAB8v3B0C6Bu3FgoiXns0
	XIW9seW3BSqJavC3klNzUf4DPDfvHsSnMYb0Y02AtYLWO1JN+XpCyVvPiDF5llZmL1+giE2PoOG
	92hWFrPJdstVe9Lt0CCDA+3R5e4tRubCtGoX8D5iQm+Nby+pm//VK0L/10Aut1s3gFqUPRbbd1h
	4kPpVw2qBj
X-Google-Smtp-Source: AGHT+IH/3ILuGxcU6S9h58UIYHve7ZcOGkQ5c4bXhhYGJd6rU5s44KkKyc4ROVc2qPREZV50hZKbHw==
X-Received: by 2002:a05:6102:8014:b0:523:e010:df0f with SMTP id ada2fe7eead31-5d5e1fbd98dmr3808638137.0.1760015112776;
        Thu, 09 Oct 2025 06:05:12 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb67dec87sm4574187241.11.2025.10.09.06.05.12
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:05:12 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5b62ab6687dso1011412137.0
        for <linux-watchdog@vger.kernel.org>; Thu, 09 Oct 2025 06:05:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDX+mLwbj/bcHRFK5gL9HyfcLbvslbwWlUWp6+FV+13fOlSCOtlaLg9SCd5PLsRoRMFUQRhDofuwVtLIOQIg==@vger.kernel.org
X-Received: by 2002:a05:6102:54a3:b0:5d5:f6ae:3908 with SMTP id
 ada2fe7eead31-5d5f6ae3db3mr457996137.38.1760015111607; Thu, 09 Oct 2025
 06:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009104500.69787-7-wsa+renesas@sang-engineering.com> <20251009104500.69787-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251009104500.69787-12-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:05:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXmBgHv7=8NTCJwZguFAKeWyWu9dWkQxa_0kKpBVC=jA@mail.gmail.com>
X-Gm-Features: AS18NWCUrBtX_uO-fi06wEi1p8_gUsISME0n2FhoKXZozrGR11xEwQp2ykYneWo
Message-ID: <CAMuHMdUXmBgHv7=8NTCJwZguFAKeWyWu9dWkQxa_0kKpBVC=jA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] dt-bindings: watchdog: renesas,wdt: add SWDT
 exception for V3H
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Oct 2025 at 12:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The SWDT on V3H has no reset bit. Make resets optional on this SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v3:
> * don't introduce new compatible, just make resets optional (Geert)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

