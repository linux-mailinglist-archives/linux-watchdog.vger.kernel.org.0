Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12BC66DC814
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Apr 2023 16:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjDJOvr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Apr 2023 10:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjDJOvq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Apr 2023 10:51:46 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358104C17
        for <linux-watchdog@vger.kernel.org>; Mon, 10 Apr 2023 07:51:45 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id i20so8508287ybg.10
        for <linux-watchdog@vger.kernel.org>; Mon, 10 Apr 2023 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681138304; x=1683730304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DS7lM4UvPhdsZz3QUAdTpEwkc1b3jnb1BvSC4K65hcs=;
        b=h4PKEDoQDsUC8mBNp4HscgecqV8REYXFA4+CGebmmkkxZHAcvh8QzKzPunfvUg1f7D
         XQxJ4UlJYaDda52CWHtesoL6yEj9FEd+v36Cb23Q3O/ZZSdP3BP8HDP31Y6F0MNjCuUm
         c4C9bz7CFAVetMIDjiG6MLoCbV6EDSkvj1RYohr8XR8kcpC4tjPKrBlNYt+iQ7X5n3Jl
         9ieHIIVOYIIxhUakdQBdjOYyMTN4HWirWtHYwLf4+fCTpZKkL49B+UlYdauym46uHKcx
         FetahX5cSGNxhoT8lewBl96h4Al2UKEKhbjeenkJhODxO1ruO361k2gSa1Mxl3OJpjfv
         zRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681138304; x=1683730304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DS7lM4UvPhdsZz3QUAdTpEwkc1b3jnb1BvSC4K65hcs=;
        b=L4OmIAfwuTHAbAcc+1pYOTKIXJ59ByKXYYG0WPB53yPnOP/s5m8Ma8FgrpzBc+OJR/
         uiM5LSh9DtwYZNefalRcK39f+LRNLVuDLTi/LdGptoQ/DP3a+ROUnYBBd8s2esbthz9L
         QocwWfYT7G8/Hmgz/2X81j/j5GKDMx9MTyEOM1HMSSNv1IPQGPKUhbFc7vZ5P0TONsFp
         OhqMbObgolt42itafrVgM0GemrPqTH2iga/jbCGMhMvKAabC6FUzSHxATdryZguctpm6
         JQmnXpw8ko/efTQbF9kDHTudD/Ae8fO4kA6mLduzrhlUaQjHIrNDy5a9gaZWHw914rqu
         O42g==
X-Gm-Message-State: AAQBX9fNVhZ1NEx6v8u9w/lgXswQ6RSZhtv6LxRrAeh8l8ge7GvOTV7/
        6X3EsYXTIDj3nyTPK0N65AKHRQ==
X-Google-Smtp-Source: AKy350Z7iUPXJT7xvEHCirYFplhyypqwYmvgJbb+dWAEndGof6Ml++KCOMzYUg1jEW374gcAxVHVcg==
X-Received: by 2002:a25:dc88:0:b0:b8e:d098:26ee with SMTP id y130-20020a25dc88000000b00b8ed09826eemr5621383ybe.29.1681138304298;
        Mon, 10 Apr 2023 07:51:44 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id i13-20020a056902068d00b00b7767ca749fsm2956110ybt.60.2023.04.10.07.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 07:51:43 -0700 (PDT)
Date:   Mon, 10 Apr 2023 10:51:42 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Paul Demetrotion <pdemetrotion@winsystems.com>,
        techsupport@winsystems.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fred Eckert <Frede@cmslaser.com>
Subject: Re: [PATCH] watchdog: ebc-c384_wdt: Remove support
Message-ID: <ZDQifl7EB33dh/eu@fedora>
References: <20230410143101.182563-1-william.gray@linaro.org>
 <7b0fbd06-73d0-7fa9-3f03-e788f1df4631@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kXGntYyXbZjGn7a2"
Content-Disposition: inline
In-Reply-To: <7b0fbd06-73d0-7fa9-3f03-e788f1df4631@roeck-us.net>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--kXGntYyXbZjGn7a2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 07:43:37AM -0700, Guenter Roeck wrote:
> On 4/10/23 07:31, William Breathitt Gray wrote:
> > The current maintainer no longer has access to the device for testing,
> > the original user of this driver indicates that they have moved on to
> > another device, and the manufacturer WINSYSTEMS does not appear
> > interested in taking over support for this code.
> >=20
> > Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
>=20
> A bit harsh, maybe. Just mark it as orphan for the time being.
>=20
> I see there are other Winsystems drivers. What are you going to do
> with those ?
>=20
> Guenter

Oops, I didn't mean for that commit message to sound so harsh but merely
log some brief reasons for the support removal for posterity. However, I
adjust this to orphan status rather than dropping; what is the process
to mark a driver as orphaned?

As for the other Winsystems drivers, I'm still able to test those so I
can continue maintainance of those -- although I'm always open if
WINSYSTEMS would like to join as a supporter, or a user co-maintainer
comes along. ;-)

William Breathitt Gray

--kXGntYyXbZjGn7a2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZDQifgAKCRC1SFbKvhIj
K4PZAP9vBvzOzd8mRW35dKX/XGo7maxqBvWwRcgTzfvwb7iMygD9HKov1wQXvkqZ
MZsaSR0i1y6OmR4CUb2u/g3GRE0L/QI=
=Uzif
-----END PGP SIGNATURE-----

--kXGntYyXbZjGn7a2--
