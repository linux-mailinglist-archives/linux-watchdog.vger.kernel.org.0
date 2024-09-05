Return-Path: <linux-watchdog+bounces-1760-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E07796DA8E
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2024 15:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 616291C234B4
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2024 13:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605DA19D88B;
	Thu,  5 Sep 2024 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="o6yhS0gf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDDF19D885;
	Thu,  5 Sep 2024 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725543694; cv=none; b=F+Y9CNoLQz7jW0zxTfDW/qEbi1XkXvgeP4CK0OxNE4Td1z4UffAO+W1ehs5JyObI4vxT+qXjqCkZ2tjl0cdUyydgEmDd49QNT47VWlQPuywylvz80XIVyTTrMldmf/hROOczipvJlwTPdwItvtv3AZL6q21Pr+zzsif9RUofNEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725543694; c=relaxed/simple;
	bh=1uYaiX6bFTG0wzTHhjTW5g+OiwYm/81ayeQIaXdTTsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0LZfB7Vd3v0LnpwgYMHL2DFd39wJtUflhdmMIrS4ityrc2MZ7aM8+AIRxV4x9sIxIChqT8g8Gkb8ESWMSF5cSekUr3ClmD/Ln1k9Eha0w54u2q6YvFgVCWE7QXUDHDiswTcGXh5YHF4yx/2l1oHZXaj6nZUcbuu6NDkfvSGx44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=o6yhS0gf; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2290D88BBC;
	Thu,  5 Sep 2024 15:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1725543690;
	bh=xK6a48OIHXRWC6vnsA0HEz2fohBA/zvNxkzg+jmPZ8U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o6yhS0gfaz8fgAMohhFULwaAdU4NkugjM0uFQ7O0C0jHG2HUfznb7vgSLg4VEOB3e
	 Gn0UQpAL3kC4u3bd/8rHg5QuA+5uGQTJlTsYlbBtpw8ZoZ0CdrlxUjxsR5vCYs1npu
	 dzX5oVgL6glA36rWolkK7AEzJkdCsHIwYjttBcWyUagkDmLSp1IEorVkDjCi0Ytn7w
	 aF37WNrGNCXMDWRCVl3eYg/fSdftCY3rYUQpTm0BO9cl1xlgFsOlvqbgvU6BdQzWgk
	 FOjf/lOgXmOIDWDqrsUMnnVXkUWNbB3CAgxo8c7gZL+yjPJfCovkL6yp27ABh4ifIE
	 s6I36O6x0PhHQ==
Message-ID: <686c36e4-bb3c-4a5f-bdb9-1bf1accf1632@denx.de>
Date: Thu, 5 Sep 2024 15:09:39 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: stm32-iwdg: Document interrupt and
 wakeup properties
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240705115052.116705-1-marex@denx.de>
 <975dca14-de9c-4bbb-bf4f-e52f7f52c83a@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <975dca14-de9c-4bbb-bf4f-e52f7f52c83a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/8/24 12:48 PM, Krzysztof Kozlowski wrote:
> On 05/07/2024 13:50, Marek Vasut wrote:
>> The watchdog IP can generate pre-timeout interrupt and can be used as
>> a wake up source. Document both properties.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Can someone please pick this up ?

It is now blocking addition of the property to STM32 DTs.

