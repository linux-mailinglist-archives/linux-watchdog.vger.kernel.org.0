Return-Path: <linux-watchdog+bounces-4481-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FDBC225BE
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Oct 2025 21:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 05B434E52DE
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Oct 2025 20:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3A8333459;
	Thu, 30 Oct 2025 20:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7uDKeDw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AFB3271F8
	for <linux-watchdog@vger.kernel.org>; Thu, 30 Oct 2025 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761857785; cv=none; b=BbiYf0Fcxkuhvp0OUkgmf/oIKRBgoC57vNZzb/SEewATHiJX1eDVzbKWq9/9A4n3Ux5b757ID2wDEvaNW6EMBWRIHD3tdGM107WC5s1usUb0c0r2j/EC9kIF/9G+lqYVa81lpNnkX9ZMmY/9XpUFIel6JgkQDwSzFMQh2sWMuVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761857785; c=relaxed/simple;
	bh=4/rJonOx6RDrn5ztFXNDdyeJEpu8yBtzd5+IN7afzbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuCVAOkBUc33maLGQkZ1YYz6cU+KH2kU4NyAG17wpUV9yG7mecBLErKKoCqQfnDLtp0b3wBx4qxA1x3Vd1VHMnRow25XA9L7DyEBLiyRtq0p/VTA4o+rIe6HSFBmQdlIQPkP+TN0OtdrtuIuyo1l3Bxe43y3TQ2QjQv5R+6In7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7uDKeDw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a4c202a30aso1740925b3a.2
        for <linux-watchdog@vger.kernel.org>; Thu, 30 Oct 2025 13:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761857783; x=1762462583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FyyBv7XiGB0A9ajOq2ClS027aqw2mhgkT4I+6YXU7S4=;
        b=X7uDKeDwVRJP2yWipwFjdh+WIBGxVxzAcGnQbH7Q9C6T41FJDcnNzi9i+VA5NgDEUV
         v4mupclQuBKzUdxNcTiVScpNBDeWBs1+fOEQXBg0ngEs95qJGEn7i+NFPT1ksjAgI1Kq
         Ab671YbskH9cH8u8GXE5YZ5pV6XmYLyKWhNh8O3VnCHzmuEAKIAc7bSsZD55CdJyA3r5
         lfANUV7va0EkIqRpjIWbZB00EKC9RPu6zd2aV1Dks2hB8Zuyr+CFXJfuCy99MvsSR419
         YbezD7KpaYmOFc+ztNEzAb6iGtKD6YZXaoXTigae3qjVj1dMHoRQLUHXf3L/85IPEZ+K
         q4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761857783; x=1762462583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyyBv7XiGB0A9ajOq2ClS027aqw2mhgkT4I+6YXU7S4=;
        b=KtUW4316GEvRDdMMCP7ln8mSfSTPTY6AnZe8RTwBF1TzH41i7K6P7vYUzF5B/ICndP
         QFcSiiarN7cEN/IdshqSZYBKu78sE12d2BdxWpLPCObkE1EXFvkTUqeJV2c2uoMnF1UQ
         P+vjh9VzIvBDqAewuMqecdmMISWcHXI2Y0lUHvEgQgcs2idGyRCjBMFnR9ffCTrCoLRY
         h3eAJip7yK48wYLBKfJ2/oqjs3Scj6zVEMR98sN0ji6QE6xRmLqVRcIzp7R2e7jotoWH
         S1/OuLCOYOC4Xws2itd5Ami/zOKnrb9978bPXyHtGTv1EC/9zFPri7iA9BNqGlw2XKQf
         KOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU58C2KXMEj/uK14dwfoJ9TbyX6vc3QEzIGFLiDfza4HO0FiGDd9P4j6MNo49AooEpw/2SpTqya9KP71J+H1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMu+JCkXY6gWfiDpcobyDe1OFo78iaFjt083oZygBCB675p3gg
	O/WyM7ROlMOlg3+dXgvD0ML7btDeM1qUeTQ2Zgx7LSodYMlIFTa6cjKb
X-Gm-Gg: ASbGncs4GvUSMpGybFJumZG99cae1bddohlOSRccPKANnAK6qT+ZdHRV9lqn7mRfazS
	3C3Ca7zo1HFFZmuaF7Gj2zU03+sTAanU12wfOxuNRLoMjPiugtsYesgJb37haRKRq08OTsLE4AZ
	iwzGX3ZiA0lroZtP94LHpac76f/UH1ff2Ln6tD5he5jVWdzmGb0bC7UZb4Ai9EfFtdLJQ26uNOk
	wdkBj3uhOwR67SsUq33SRd8lFHrHnIwKip9b8QSOgEkCEIy55dCI5BHyGWxpljtzH/Ab8nZOcm3
	6+TZud9Oge7cyHQrt5EBon3YPIkqvEgbhy5vchxROrC/e8DPU/L2bWpkfsCIXnZ+5WUTZECYT3y
	YqeYQ9MKQJe7Fk7oG4Jq6y+LjTvGC2JYJQFImn5LGK9Fim/Mwx7KeBZCdItFkmzDiJ01XVSVgjq
	fJHyiD9AHekoG/ZgyD/Vs1RVVy+QwF3vaytSBLJ86uAgtSP+7u
X-Google-Smtp-Source: AGHT+IGNmTbOXun2+o+j20VEBL3MHIqUqnzHFtK5+3NODUKJ3fvksSh61+6iQ3JoqxN1WGI28rXt1A==
X-Received: by 2002:a05:6a21:6da6:b0:341:dbfc:c73e with SMTP id adf61e73a8af0-348cb9a0bf4mr1506363637.31.1761857783191;
        Thu, 30 Oct 2025 13:56:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bde68sm17870156a12.1.2025.10.30.13.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 13:56:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <df55123a-80f4-4c02-bcc0-084e01a94228@roeck-us.net>
Date: Thu, 30 Oct 2025 13:56:21 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible
 for MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/25 00:40, Louis-Alexis Eyraud wrote:
> Add compatible string for the watchdog block on MT8189 SoC, which is
> compatible with the one used on MT6589.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


