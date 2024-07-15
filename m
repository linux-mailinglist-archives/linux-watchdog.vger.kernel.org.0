Return-Path: <linux-watchdog+bounces-1386-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9317293190F
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 19:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B6D2282087
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 17:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46C43D97A;
	Mon, 15 Jul 2024 17:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlWhJc0l"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1924512E71;
	Mon, 15 Jul 2024 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721063805; cv=none; b=suuU5Gpj/nnks47PfVPtO162pI0wImuZ+ylzS40S1aAw/QECrHUe4qkrl4CRm4sLV1wmnUf4P42N6kuNYYeKLSy30U7P8i6cp0z2pvgRCPfuUBj7oiMhR9r4CEv0PzJ536DtkoVEL4kZxYCKpIf7FeoWlgEEMDlms2HJTTYjS3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721063805; c=relaxed/simple;
	bh=VrwhL/WWFEwVAdFgcTAL6RMVGDd3xEeZ6NaVc5vbYOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyhcHjjiSF4M4YiwdHxVpD4C8twZau677pa5YGxfAhCMk50KHX14HXz77hFqYH4iZwf1nwONqIweZsenynr4RwdydUT8B6Pd0Hq3fBAm+4As1i2Z4icHePT3W+WG7TW02B8sADk1wcb5vKp0gu5oZYpR1xMCokvl09uDTDGqQmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlWhJc0l; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ee9bca8675so6344351fa.3;
        Mon, 15 Jul 2024 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721063802; x=1721668602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrwhL/WWFEwVAdFgcTAL6RMVGDd3xEeZ6NaVc5vbYOo=;
        b=WlWhJc0lRs+hNW4N24fFy7LB9S0OtF1zucwnCu9OhgO1SNM8IENUzt/GHmduIKiEGn
         XYZlB25+pgKoH7VFZo6ciCvufnDkQylkcNjT4cDuC+fv5dXvVKFg7pdFOa4ZUqIPdt7A
         geSRGyecld+Vzwk5asv1rtUXoXAImotn26EFmQO9jfWJsZmATA+g/6jxBvn0N+d65A+Y
         JyDmZezlNJ7v6jsI7BbmMfa2arPvBHBKlhbi2+ICIizczJ3laKVedldbsdXGkHFSBTzK
         1ZN1rrnDvIU0KY6FKWLp2rTgsDynQK/FzpY0Q5C6wACjbw6R5ZqVEQvn8utY/TkYbSX1
         G0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721063802; x=1721668602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrwhL/WWFEwVAdFgcTAL6RMVGDd3xEeZ6NaVc5vbYOo=;
        b=O04uHvusLx8leoi8a3ccRaaR2KB8rYb1gSmRUFZkKRA0XiINA3hA5aYC+PQd9dJ/40
         87PIaY6KNoktiTEcE+WSXSkkyOcC6gHi7bczNx8kQ6TNFkxo4LsEql2ETYPhRC/sMYOE
         nomXbqDj3cNWE0FUnlmhp4az+XMNs+xjL4Pt62w0yWoqI3cVN64cnCv6sPevb6hVWM2/
         VoZ1rd5Y3Ma2UCUVuFGc3NvvGaeEudlb96GT5UfPU8ygRIzMllt/zcxK9JtXbauxkA//
         3Gj0fS6AM/bxVn9pY9CTcuwBveyJnt7o0JZaFiTfE8JsLVZp0+LUubpPalJY/tqR0GYe
         hJew==
X-Forwarded-Encrypted: i=1; AJvYcCWIc6/zCoqA2OiS3gzjTJMtC6tk73UBcktpaqyXqn+/dLg8IpgNV6GO/q2fn5IJH5vKj8qIz6T8B5xdmB6RDyzZSZBkmBQFkmT6xh4Q6G8T7tnI5or8GyYyjlPwG3YgFRxkQMibsHedP977PHU=
X-Gm-Message-State: AOJu0Yzl5Y6ZZT/foYJHZK+hUgYYiGyVRD9kmZ9COcPDF2JGB22/G6Iy
	WYmXOaQbm5lAg/FFJEFCl/ZAicyX1Vjc/ALzyD+FMTaYUUxXg0qTeBxwfE+HQqqjPeB0V6MMUzQ
	qEEaFo6VlM+6KKkM46y7/iLZg6+E=
X-Google-Smtp-Source: AGHT+IGqj/MjcC9SL66CDGBtMbvhUOOXfhuipJ0QE20rTpuMabTz5orc9ZQXo3vczn3r1jLbybvKn8QCBgh2RRHhdSc=
X-Received: by 2002:a05:651c:1a08:b0:2ee:4a99:6a3a with SMTP id
 38308e7fff4ca-2eef2d6646fmr2979871fa.2.1721063801883; Mon, 15 Jul 2024
 10:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715170717.2490688-1-Frank.Li@nxp.com>
In-Reply-To: <20240715170717.2490688-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 Jul 2024 14:16:30 -0300
Message-ID: <CAOMZO5AqX25zduLXfXq6zU4SLRC_zs6ZU_D7ouA70iCdp-bt_g@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
To: Frank Li <Frank.Li@nxp.com>
Cc: linux@roeck-us.net, alice.guo@nxp.com, imx@lists.linux.dev, 
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org, 
	ye.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Mon, Jul 15, 2024 at 2:07=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Move post_rcs_wait into struct imx_wdt_hw_feature to simplify code logic
> for different compatible strings
>
> i.MX93 and i.MX8ULP watchdog do not need to wait 2.5 clocks after RCS is
> done. Set post_rcs_wait to false explicitly to maintain code consistency.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

It looks better now, thanks:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

