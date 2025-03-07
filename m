Return-Path: <linux-watchdog+bounces-3075-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B43A56D06
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 17:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 107F57A90C2
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 16:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404EE221571;
	Fri,  7 Mar 2025 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7F2+DLX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7886A221D8F;
	Fri,  7 Mar 2025 16:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363353; cv=none; b=hiq6Z3tRfAOXSAvbuidBJMkp7SpJ/QBKoYVea/1i1e/GNtlQ1eb2SAqywfqngYc+6niRdJhj5QRvq+po/ZCH0JqObqfm1XnSwawREvjebMGu9rcugojKRIR+977kAFNaoU7W6cRtm8Bl8k73kk63D8iS44nrC7uYAH9dvu9Ynw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363353; c=relaxed/simple;
	bh=lFdxkbYzjD0P48GbkFhKMmz9eW4sEbkQm1/W23ttC3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SfP2xUjVC1Gt12+EbShQv6lIzQfjBzr0nsye6wqsuCS7ZuQB1cQAS3yiOsFkw4bo3rZdbcUGmONnclisN7hUXvFvhwhHCfVOdx+XNYze/X5hCCxGp68ZNvEr5623goUbf0yJm5P/M1DeM/TuXLZXLY73rK4GkuKP1+O5XLgwZNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7F2+DLX; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22185cddbffso60184515ad.1;
        Fri, 07 Mar 2025 08:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741363351; x=1741968151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zb+NvzLUHQoq1FpAOfoO3rgYMLTUz+QxxpRaXvte7s=;
        b=g7F2+DLXd5wXgN1dXaOKX3xMo9xTqJtVerKRgaYlFYPaNoL2Am+nrPrzsZlOLuxhZP
         YVvpTv1Z85QLA+r1PacbPBpRNkthHUxKIAydYPodljjT0JGncecFaGCJBMeyN/DPouUM
         HMNQuQ5I5uJQt+1gX1vZRriKl8nNOwGrYa57p/su2kilCZnLJRwdDI4M9WK4VfzC0Mx9
         /ziTDZLxDv7mzMjp868nHAQF1mseEIWno1NKqEPVhxxBp4h0879w7PGBTfYq2B/TauwX
         GDAh8OnB9WPu/n4s2s8ZH+GGmtuj/58tCAJR4RgH5hGdpWUjMUcI2ks9ry3cgFbfKRCB
         NCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363351; x=1741968151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Zb+NvzLUHQoq1FpAOfoO3rgYMLTUz+QxxpRaXvte7s=;
        b=rXuIpNXhKdy5WetD3NZzruR5w7xYgAF5nT7YHWvXFcrxaTtFROdKyEljeUm6FiIGs5
         9FIU4vhpZHe8cDHpfwOoMKLrgnNcaPFohCtw8bcSzCrc5iuMYpoACza3AnHjI4HcU+3P
         Cp0C81OtTa1c6ms6FfbjA5JzxD9rNtnIAv3/PazRxm2AaBfU/POhDq4VouQdAqFbDgFc
         QRb//np2+f36CBnY21ua5l4VKndj2SLHid7Yn3Vvp7fIcqnCG28QYpecmbErGLwErLAr
         Z3K948yiUyYaXl6RVLlmQtGytHHY8rbZKZc13OnbnU3J+kjQag18Nw9ZUVrnIjYKkQ0q
         yJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM7/FzCq4CfZGNwsWjDTVtw9QrxJLuqFizWPXdidhakablU6q34pONhFsvHGEA7XyjFCbc3/iQOlumY9oe@vger.kernel.org, AJvYcCWw+2W7hMGMdG5tKJ0XP9OjCT/46YvG7bFe50V5Q92lL4zAMn05aOn/1nEglmNONOzyMEdUmpZ+ZnyJ@vger.kernel.org, AJvYcCX5Caq/CUrO8hXrWoqzYhPWvMmupyEjWydv85dRm5o+2Atwj3C8XojgbMtGTplq2jXM4Q4CtoE6muHVuzwY+nY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg5IFcd+obc43WrVE66atr7XFsewexyWDpUG9bqkzgGlDqFsMs
	mZ9Sj/PpbTlzrvvwecFw8IvKO5KovaK2zuxEkhO/pbSi8orepF7Z
X-Gm-Gg: ASbGncv28peL29GLx+1MO5PN3gnxMp1aB6sSMU6lL443iSxY1IO1FZN4OuN7FnDMwGW
	Hj8QoltDAADKlSfZiE/eSbIlwdOLEflZnSi0pGFAm+dE6gsZjz+M7WzHJgFeNt6wZQlsU0B9RwF
	qoELB2+um/XAwc4KC/aX/uIezt30aes385RlhZd5FnVUzSktwgqkOOKOMTp5Ry4szQUHbFKK7Bq
	0O306bkm8e9uOZkF1ZmlxiH9Ecz2gVHnOY5iAXPlyBLGlApLSG+Q+VaP7ivKrczBSVoOMrHfm4I
	1CzwqHSz5ENsWHmu7Tx25h6amT9gTAGbq8JPv5A7QrFHe8WwDMSBOhFSTSLZNwyqUcDCj0yW67N
	LGqjDglfJI8/GrJObnA==
X-Google-Smtp-Source: AGHT+IGznSvrYjNrYuAgQA1A2W1jR7Q+mpt9Mdt9FcdIUUbJ2WN2Iq2LMwq9M4nmJ7MiIMinbFk74A==
X-Received: by 2002:a17:903:1a10:b0:221:8568:c00f with SMTP id d9443c01a7336-2244b098602mr1713835ad.0.1741363350733;
        Fri, 07 Mar 2025 08:02:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af512724c14sm468713a12.37.2025.03.07.08.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 08:02:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <64d7d06b-337e-498a-87dd-03ae41e6a2de@roeck-us.net>
Date: Fri, 7 Mar 2025 08:02:27 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx7ulp-wdt: Add i.MX94
 support
To: Frank Li <Frank.Li@nxp.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250307154424.2613795-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250307154424.2613795-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/7/25 07:44, Frank Li wrote:
> Add compatible string "fsl,imx94-wdt" for the i.MX94 chip, which is
> backward compatible with i.MX93. Set it to fall back to "fsl,imx93-wdt".
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> change from v1 to v2
> - fix typo im94 in compatible string
> ---
>   .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> index a09686b3030db..6ec391b9723a5 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> @@ -22,6 +22,10 @@ properties:
>             - const: fsl,imx8ulp-wdt
>             - const: fsl,imx7ulp-wdt
>         - const: fsl,imx93-wdt
> +      - items:
> +          - enum:
> +              - fsl,imx94-wdt
> +          - const: fsl,imx93-wdt
>   
>     reg:
>       maxItems: 1


