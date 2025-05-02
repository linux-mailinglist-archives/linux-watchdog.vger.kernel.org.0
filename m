Return-Path: <linux-watchdog+bounces-3408-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A6AA72FD
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 15:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F1114E0E82
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 13:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C1125B677;
	Fri,  2 May 2025 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzOQvT+6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E694725A353;
	Fri,  2 May 2025 13:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191335; cv=none; b=aAHo0Ih9tfIfPsq89WCswEPEwkNAg1vmy+lrBUVIq2BrW4+Gx1NWvw5jmZX0tbKLmK20ytLSI2LXFL+KPCHYIw9Pz0Gpk0SIQmtU76SiHa8wUJbNg5z9xeQvwtBhRi6FZthAszktrX4XcdD0wvuAPqG/q9qM6bbH8W6xPnghQnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191335; c=relaxed/simple;
	bh=K45+jnAwgqGxsKwa0YV5hIGJFdEwtfa90HqU8GLRK5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jkb4mc/ppB4Z+PGgexgYedFJGy4LwCFPQsmfn7XX0TJnQBRl3p0OIOp9seogn6KevsnalTFy+Yr+iIKrCVicus3FM9UJCWVtFvJgd+CDV9IG0N6B0TWrT4WICyFvK5vatYkM7oZMN/HqlfHEg6V6e+Pck3a3gcj4wlCnbMNgNWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzOQvT+6; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7369ce5d323so1865732b3a.1;
        Fri, 02 May 2025 06:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746191332; x=1746796132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5zFPSvTZV6xwJ05g1Uom0S9ocPnq40i5wq9xeFgZldA=;
        b=GzOQvT+6ZmrfCmNh78faxbv+oZNQg69PCR+OKBgCZJYIpGrSmOyjsnSKBXDhGMRn4S
         vZh1aRR72f8U1Bcnpv0MwJ1zR1qPrwMnZGj//S8nX2zSsauKvWvM0od8k5ppb5CUfjLY
         gSlqIf6NsPqYvvcL4Uhyqb5nAuS6n52P/P2zfGu14mZHtp5ZV3HyWeln8fPoiF4qEv06
         w+ExMSGyDKkDgztnM1dbby8UAygPcIreVk1wTmi3xSXN22EkBxAiozQr0U1AKoRT474u
         qiqEQ/rdQJpRYrUfOBaJ58hvcSc/TtkDMIhhLYG6hTLkFaOFb/BDT7P2Eocyel95brrb
         vNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191332; x=1746796132;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zFPSvTZV6xwJ05g1Uom0S9ocPnq40i5wq9xeFgZldA=;
        b=G8YNL/FguX35ajqBl8rx4EjomL0w/JRc4CZtuiAZa9dxOSUBdWqqpMuW9GWde8crs9
         o+TvIPBym1FKHowMeLrbJw4xKElb0bDASNpw2fR9/KFw1Z7WShW2XQp4hd9kww0GzhDx
         cJCuzWUcBapAaDvNzNiLCC/9zUQ4yh5ZtYmZxyJhgSijb/RjptlAkEEceQi+JCgcVIcC
         I1W9+4Euw2HLdUUVknlRxCD8/bygsPLNXNBHNvBPowPdIq3rJCAdT1B7z+/9dayXdSKo
         /lD6fooqnLAQ0bUrRL+jW6hxwxPNGIuNf8ioMwvaVMwbXauIjC4E78WQZtlRAIP4zBtO
         GedA==
X-Forwarded-Encrypted: i=1; AJvYcCUDiRZlQAmqFFod8E91B1MtsV8vC1el6yJNrGCFQ9Fyap1L9vV5XnOYDJVRPj/7OzBEkZ86kp0bqsNMtlT7l2M=@vger.kernel.org, AJvYcCUazMQYFO0hRLf5cbqwojyuzH9xzQEiur2qahMAO0oWoxVXRnBVcFjIf0WVzDDY5HIp68wqaOUhYuLNIjk=@vger.kernel.org, AJvYcCWuJAD8hMziWsPVOoWy5UcpFHmiGkiJ+d4B+A/weQxxCOgMEfN3E2MPVIZZ/4cRfpgYxBLeyJ1wiuFhwYRAk7tG4JA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4uIAWqyArD534es8n+246rOXisDMp41ymuls/v7su1HoJg5T
	h06LT+6D4mxC6oUh4LDf5oMYPO9XBTczkPpNn5uD+m6SUydUs+yH
X-Gm-Gg: ASbGncvPc2FAPkYqIIOe1laFxadbpuhLggbsjAQeOBKsHOqZqxOJdv7nSmid9YSD/f0
	D1iaermhdSb2LFmd6Gnmur7bKAE/7rCIL3IWrrlaEG1BSvuqPiMJ/QB4dOpeozDxmFE/1JlEBak
	wxqIMPw6fbNNI63ZpP5n+LHs3moYLD5Ro4tzMxhb4S5batWVVyY8iUdYGkq+8dEmKMd7I794Auy
	SZWARJFEL4dqztUwxhI6gjVZvu7kAv8/owSuBjEC7mAmgvzBax9DYBCqJrUySIrc9EwcBVCrNc1
	MS8n8yhAoorqGWT8SKs5Rnu2qS2YyUwZpHNlkrL3TUdrilGkGwXTw/DxilUVq7L82AVV9L5OArh
	0jhiKIluoefJ2GQ==
X-Google-Smtp-Source: AGHT+IGaAsfQdzwAlNP1PWKcKnbMPs3aaElsvCy60p34IvS3SmdMFcdU1VzYoNo0kWRiWg1plLRKnA==
X-Received: by 2002:a05:6a21:8cc6:b0:1fd:f48b:f397 with SMTP id adf61e73a8af0-20cdee3ade5mr4187467637.23.1746191331633;
        Fri, 02 May 2025 06:08:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df43c8sm1460915b3a.84.2025.05.02.06.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 06:08:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <be0a5d8f-2b51-4cf7-be74-8aaef6ff848d@roeck-us.net>
Date: Fri, 2 May 2025 06:08:48 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/V2N
 (R9A09G056) support
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250502120054.47323-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250502120054.47323-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/25 05:00, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document support for the watchdog IP found on the Renesas RZ/V2N
> (R9A09G056) SoC. The watchdog IP is identical to that on RZ/V2H(P),
> so `renesas,r9a09g057-wdt` will be used as a fallback compatible,
> enabling reuse of the existing driver without changes.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 3e0a8747a357..78874b90c88c 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -76,7 +76,9 @@ properties:
>             - const: renesas,rcar-gen4-wdt # R-Car Gen4
>   
>         - items:
> -          - const: renesas,r9a09g047-wdt # RZ/G3E
> +          - enum:
> +              - renesas,r9a09g047-wdt # RZ/G3E
> +              - renesas,r9a09g056-wdt # RZ/V2N
>             - const: renesas,r9a09g057-wdt # RZ/V2H(P)
>   
>         - const: renesas,r9a09g057-wdt       # RZ/V2H(P)


