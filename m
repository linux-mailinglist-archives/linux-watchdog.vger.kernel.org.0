Return-Path: <linux-watchdog+bounces-3382-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F634A98BA7
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Apr 2025 15:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5981B806C0
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Apr 2025 13:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3293D1A9B4A;
	Wed, 23 Apr 2025 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i45NS8VH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551371A23B9
	for <linux-watchdog@vger.kernel.org>; Wed, 23 Apr 2025 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415798; cv=none; b=MA2IhtV/BNOwvyYTjOkSVzINAo+Bqk4qgtCu5ro6/GAnby7LAip4N27Dkic8Ojlm6LQi6KIcltNatmZ1kG8iqN7949DKNQNxdmKfXEDLQSl+LMyjxRIOvc6jJLPqN0otEZ12RLGjqNbkPImCOMkT6s85k0Rl1STZ6Gnr0yYvmPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415798; c=relaxed/simple;
	bh=2oNxgFh7wQy3eSTXUuVVZ5YrZWKlKCIvbcZjJzlgFfk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=d9vMbiGXuwPzKVw60f8Vey4ABTGuitw524djmSWCTIRDPoFLAR40Oy8wch8xXGrdutNCtd1rV1rcEwJwX98cUHBKW9iMohtV8o5afd1+9en4bWuLSseQJGkX6kjC4BgxIyi7APPPRKhsB6FYWRRetyuE2ofdQGs9DiJDV80rU1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i45NS8VH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso62196855e9.2
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Apr 2025 06:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745415792; x=1746020592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfrnhMcNKf5rCGWHGoNIZp7mNgbnWoHESdB7RpEhfqo=;
        b=i45NS8VH9j1Oz0y0h9MAM2BESfQeaGh+Dh+a6FJhpDkpc/b5nSBZi6eUChnC3FtqOB
         h9RYFH9VVn2NY3O6feDekcZTqtzU81CFECv4chNYTcRWpXluuaXpyhvsUJrIwD3lvj0i
         g541zgQKukKKx5+D2EpbjzeO6J/1nFSeAOSvvyYJxVgmqlHzBUegXZf2/O1wUR5QnTKL
         etVuKR5KPf5z13JejwrvSqbRsCW4zFAUwncAbqrA9TIS7dVdUaGFDyNAeWQ/6swPf5U3
         0bD/tIlq0iMfTnvTVLaD15P8xHbFsCCKpyh6UgibOswlmcmWqOM6njeJJ+ECcYGXv+aY
         XnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415792; x=1746020592;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FfrnhMcNKf5rCGWHGoNIZp7mNgbnWoHESdB7RpEhfqo=;
        b=N4yQFSlmdS2CppW3VxtKkDwvG2ahFqbFGfIz1kdl1gkOvGWe+rXbPiaXre+/z+8loY
         WvDxs0lv/QPvy0pqs+Kh7/DosFuJ7eEOhsXaf/eRV1NTEHXciyguhzqxHCJy4Sx9SuLL
         4PTZ5XmHq+GocGYxnsyRCAP/VTxWg7YW1dlfhUi7VnHvfGJ2Opf9PNfRfwGeYx2FLLa3
         8nz5aOoRO41xYfGP6c9kKs3TAe6fpTNCXhrTo6jvWlae9OXKLQDnnk2wmrlXq3ejqTwK
         rpb67Cch3sBX0i7y0dVHzEdG2bWAhzS54lrGi9y0HuTQXp4C7w8M9i04Ho6NkwElFi2Y
         Zy2w==
X-Forwarded-Encrypted: i=1; AJvYcCU3KRhNrF+EmkM3Z/1YjjXyM2jPsSugxUyxqGo7Ugu6xi1062lg/xhRcgWQ1Fcm0/rm1cncR6GLoU40scNK3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsqYT4VfMhh1Z8P9gBPWxpBW5L9MVRlhJSD+leVtCvNv/W6k3J
	TmcTtys+rQibhcGWrruXrz+E0Syb7cMZ+Tv3/NPLhvr1MZ8gLX4xIU5HxxPk8i8=
X-Gm-Gg: ASbGncuJPF+uHQCixrGJEVkgAbfu28YxGyN+uF78tcpjqaHL9Y4ZiiHMBhiQ6Qh/JN3
	IO+eJqzDNC/HdT5dG9n+Jey/TSWMATGngQr1tCP48BSrML/qheKR/xpeR0LcJP6m/4t6oDIJuEa
	8Wtmg0sLOtIG8ryYCocnEXlc+CRNLn2xh59G1D9bAz1Hkl5a5xsCCkgA3W0tmyni62onD9FmZaW
	GU70xhLDjJrES9zcrK9hTNJA6oiPcRzjTPK+GilT52XiyRot3kP2nWVog1ktbmgInv00uhlgpoB
	qzSZidSXqQ4CoUTMgrsiCjyBoStxshbLlIq4T3twgeCQdjwJVeszCUv63UJFtd9rFebHhkBp2pY
	09Xd6wLbejdf6Pt0Y9w==
X-Google-Smtp-Source: AGHT+IHnS/+w8vgB7Qer4VFmmeqW2fg9vqIPQjMtQu2PKuXwZePY3kDPFYEnC2G7XWePQ888jen21Q==
X-Received: by 2002:a05:600c:5027:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-4406abfa6bcmr157183955e9.20.1745415792377;
        Wed, 23 Apr 2025 06:43:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2835:c2f4:c226:77dd? ([2a01:e0a:3d9:2080:2835:c2f4:c226:77dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092db2ba6sm26108245e9.31.2025.04.23.06.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:43:11 -0700 (PDT)
Message-ID: <1acbe9dc-02ca-4233-a79a-901e714f5c9c@linaro.org>
Date: Wed, 23 Apr 2025 15:43:08 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 32/33] dt-bindings: display: panel: samsung,ams581vf01:
 Add google,sunfish
To: Danila Tikhonov <danila@jiaxyga.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250422213137.80366-1-danila@jiaxyga.com>
 <20250422213137.80366-16-danila@jiaxyga.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250422213137.80366-16-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/04/2025 23:31, Danila Tikhonov wrote:
> This panel is used in Google Pixel 4a (google,sunfish). Document the
> corresponding string.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>   .../bindings/display/panel/samsung,ams581vf01.yaml        | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
> index 70dff9c0ef2b..a3a1de32d8be 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
> @@ -17,7 +17,13 @@ allOf:
>   
>   properties:
>     compatible:
> -    const: samsung,ams581vf01
> +    oneOf:
> +      - enum:
> +          - samsung,ams581vf01
> +      - items:
> +          - enum:
> +              - google,ams581vf01-sunfish
> +          - const: samsung,ams581vf01


Why do you introduce a new compatible ? using samsung,ams581vf01 is prefectly fine
if it's same panel.

Neil

>   
>     reg:
>       maxItems: 1


