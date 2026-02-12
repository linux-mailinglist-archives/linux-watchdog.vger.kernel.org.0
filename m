Return-Path: <linux-watchdog+bounces-4934-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBcIKNyIjWnq3wAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4934-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 09:01:32 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD2212B138
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 09:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8055A300BBA7
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 08:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857A42C08D9;
	Thu, 12 Feb 2026 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+/pTbVp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C481A08A3
	for <linux-watchdog@vger.kernel.org>; Thu, 12 Feb 2026 08:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770883289; cv=pass; b=ZawPiqpzwrYr0O9gnLW+bB8e1tlFZKJAyLP2uXQnkw6pqp2mAIWmwNEtn6NTvPELWKPAK2zrYCEsYcsr9PzxOZ4QjapA4rB51s+IXOKSLP1GxXowDmfnS/po5GL6YSvlelxFNJTPk4kFEDSRKQPLPad8Mh2QZFsUmVjKVz2UWUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770883289; c=relaxed/simple;
	bh=H9bpzueC/xhpRkv/uZFRBE7y70A6whmaWNJoFzb0zsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wd7/iEtcmUOCCYQs14FK5KTCd4n3TmVey6iA+Lv+0NmQvJoal3Y9xtKDsOdVYRgqjYYzxBDuBIXCVxbyOdYGF9WB/t8248JvtmsDb/HMaaOP06AYYKWoEXApzqyhsML+xw/fQHKgvLbMyS6LeS+WJBNZK5awDIQ/DwA2bODjuC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+/pTbVp; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b885e8c679bso834076166b.1
        for <linux-watchdog@vger.kernel.org>; Thu, 12 Feb 2026 00:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770883286; cv=none;
        d=google.com; s=arc-20240605;
        b=a5mUGALj/6wRxCOl7Cz84XwiDVibcULvOx2m86an+Dm4gFrkyMmoLUS6Bzo+Ya7dtf
         mLQk5WFuRtSr2nOAXaqDP0vUPF2PFSgttY2kKLk/iP/V7C0kszW8ikj8XJw3SZ38leH1
         EN7ASi4/CC3czuUL2zKgOc+VNPCkn5WAB9TIbTcBbA7iHkKSSZVMJRmMM4wP4Ba4TIyx
         DOYR30hr+A69xkUBeswQ+x92FIO2D2zKmU+ya3KxpDG2Olkmo0T6whA2oE/080/q3d7W
         M5Zt+vGPAjdR18mKz3HLKZy2YsONB1P1ph3zQzIKm8OaRRfuOyg5NsfHtpMHFBJRJjZt
         M8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/bjVwokrZxKsldJsperXEzSS9XKywY388N/cfuXNnbI=;
        fh=5MdDcQ5yLbUAKi1JovBd59cmadZbxDlGwkj92b23qDw=;
        b=O2mUZqz3k2jsxfoU6JcgGkl2KjUstHKxUQ8sD0WIgQuRG8NxCtQxdqvZxeGWtWO4D9
         2INGtldoYP0wawKH17QlOIVP2xfAHAp/M8FtdjAIIgn/zrgH2rsEXCleqeifj1XXO+Mm
         XaGsOoYTJnGwBdsWMp97ouWnwoBFFFVla3OGd1JaxwUWHmtuqf3Fl7ekjjVutAyLY+gb
         ykKwOKOUGNExZMZLu8P99gaAsbJamNmZX75d3WfAVQGtjCviGpPyDjqKrHvFqoF6YEa5
         vOU/hIkVva2zVUFRnG3ycrBHahV8NBWObi/YuUB1HBVw8nV5IceU91FTOMj3kzJ9EZJA
         PGvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770883286; x=1771488086; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/bjVwokrZxKsldJsperXEzSS9XKywY388N/cfuXNnbI=;
        b=g+/pTbVpif5JcKamZpmwhvh6iuq/j4a2tFAmvzt9qIGoQTuulgPsZdRG0/ccl8BhD5
         sAWqr951gEfTssA1Xgdq3fz56TZUIlnA/GLHtCyXG2XqUX05MbGApVSC5/VdPq2NVLQV
         UO7ynLTVR9lOvcvWVqxBBx/NTVgVk/UwZwlYEoz/xI9UWPT13nt5AN9JbQocdTsy06jH
         USP6R/DvAILTnIYioJSHKlOjM5Dseb2Knu7Q95VN6qcJlsKeUl491Ud2FPqgSNToyOWb
         jQTAPy/pJ0S08hm94x799OrMd3auX18R3RvNZkOZLDd2zfsfjXXuAZ7u8beBmPMaM9SR
         T6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770883286; x=1771488086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bjVwokrZxKsldJsperXEzSS9XKywY388N/cfuXNnbI=;
        b=SFAtB1Cs9bpP30eTXAgdEz9lM6elwH2856zqpvdP9a+vhvNPCCoTzkD5QjKmjnUCzu
         ueRwYh61MNgbCOLKX6Dd1vtsfgMlbFnLAWiqftueyUtQCwj1dXGDyC0Anc7QA6lYD7x/
         JW76g5cPGQ/vjlMR1L6ysZvxkPjsLzMFN3bUf3fa8LwqIuhWHbaNS6DHMnQ/hJEcxrAU
         Lcehedf3Iswow/lSiswANftD/Tz7Sgjicsp76G9Oo+VKLwvM5CxS7o1OJazVt4wZD2Hy
         EhK6uojD83252jNslNMlqurqUZijtwF3Ul54/5uZv3tuztIhlCqoUKfCG0/of/x1pb4S
         FrpA==
X-Forwarded-Encrypted: i=1; AJvYcCVOrPeuNevuOoMd5/U6b+1A+ITjT6H2ypJVtOjGlLncJcXhkRqnWUOG/qZThla4D3k3Pe0ZNuHzHKCDGY+PoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkAgWd8y2wWvGK/4N+v3h4HxgOPg+XQtSuHiiTMULU8ti5ijb1
	63XfbSfnJzM5G6ur/dMRUUW7kHlMySSUiOEnOIYHYbJmodDbE0ktNAsg4u69ByBdRXyFfyRV6ul
	6ixTloxscfMx8U9QhE4XwXzdhM2MwRmj9OFWw0W6Svg==
X-Gm-Gg: AZuq6aLUBPSYneX7ZU0eaBkhgFS9dx7OJCZL1d3tN5Qijqx+X17bKpksDTL0AxlPxxy
	c7/+/416WKDpqyISHXMPXBSiIQf9Gmqdl12sm5GGoZrciv/8YJJHapsg0lnNLkS0KjNReOtGu5J
	dRgXfQd0HU34etbBsa04TH18U/19hEeaWeVnUWmi0im3ic0AAQ4WCRpN0FqzQMbo90xvxRiqPLd
	Fbn/hKkonvZ4AVnTYRD/Rc3N/pfJnMX5QMdYeTsgrj+zFV+ZSDjU+nnhE1zvMJXCdliRLN0a79j
	4B2vNaSWsOKOZ8t6
X-Received: by 2002:a17:907:5c6:b0:b87:728a:81ac with SMTP id
 a640c23a62f3a-b8f8f229912mr118971966b.12.1770883286087; Thu, 12 Feb 2026
 00:01:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770836189.git.l.scorcia@gmail.com> <72dcec7fe8bfd8ee7e8ef58708690268f3c07d42.1770836190.git.l.scorcia@gmail.com>
In-Reply-To: <72dcec7fe8bfd8ee7e8ef58708690268f3c07d42.1770836190.git.l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 12 Feb 2026 09:01:14 +0100
X-Gm-Features: AZwV_Qh-kArDFbixo6RuZvbk22282A_FJyXPAiI4Zij2df0ii1VxnMVAlbiH_j4
Message-ID: <CAORyz2LRkVcOss3vFS3Y3FtZfn_s-Um8G9JLgedXEeySorr0=w@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: mt8167: Add the mmsys reset bit to reset dsi
To: linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4934-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,gmail.com,collabora.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.213.159.128:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.213.225.232:email,0.213.206.96:email]
X-Rspamd-Queue-Id: 3FD2212B138
X-Rspamd-Action: no action

I apologize for the mistake, I did not notice that the dsi node is not
present upstream yet, so this specific patch won't apply. Any comments
are appreciated though!
I will send a separate patch to add the display nodes to the dts and
the required compatibles to the bindings.

Il giorno mer 11 feb 2026 alle ore 20:06 Luca Leonardo Scorcia
<l.scorcia@gmail.com> ha scritto:
>
> DSI hardware reset is needed to prevent different settings between
> the bootloader and the kernel.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index caf51f203dd3..ee2792d53b2c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/mt8167-clk.h>
>  #include <dt-bindings/memory/mt8167-larb-port.h>
>  #include <dt-bindings/power/mt8167-power.h>
> +#include <dt-bindings/reset/mt8167-resets.h>
>
>  #include "mt8167-pinfunc.h"
>
> @@ -189,6 +190,7 @@ dsi: dsi@14012000 {
>                                  <&mmsys CLK_MM_DSI_DIGITAL>,
>                                  <&mipi_tx>;
>                         clock-names = "engine", "digital", "hs";
> +                       resets = <&mmsys MT8167_MMSYS_SW0_RST_B_DISP_DSI0>;
>                         phys = <&mipi_tx>;
>                         phy-names = "dphy";
>                         status = "disabled";
> @@ -295,6 +297,7 @@ mmsys: syscon@14000000 {
>                         compatible = "mediatek,mt8167-mmsys", "syscon";
>                         reg = <0 0x14000000 0 0x1000>;
>                         #clock-cells = <1>;
> +                       #reset-cells = <1>;
>                 };
>
>                 smi_common: smi@14017000 {
> --
> 2.43.0
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

