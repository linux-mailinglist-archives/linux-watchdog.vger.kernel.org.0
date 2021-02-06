Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60FCD311E22
	for <lists+linux-watchdog@lfdr.de>; Sat,  6 Feb 2021 15:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhBFO4t (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 6 Feb 2021 09:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhBFO4o (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 6 Feb 2021 09:56:44 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C81C06121F
        for <linux-watchdog@vger.kernel.org>; Sat,  6 Feb 2021 06:55:48 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id w1so17581714ejf.11
        for <linux-watchdog@vger.kernel.org>; Sat, 06 Feb 2021 06:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=a4+4vyj22C/DEQrEuAF+XhR6YRUcSGIBop8elolrLMk23ittXiPyhFprfPldUGfJUu
         2KPCRhKJt3ahNzmobmw920IaFG+hMy+Zh2WEjPe3zjcuiICPyAWoCrm0YPMeciOvHc6Y
         duBcjgbPOxKyKoUNM1iLdcKcBEjv1250PSYPu180ALLnnWeTM1qH8H5fkXnfUr5fwF4Y
         kftzl4B3yXcPFgmNoO7JBQvUDuARLPSZOT8sZeuWIm1VC3k1uYvVfwmJzPR6UgLpG04J
         9Gvj6QU0S//a3JjgcsfCNPS6p425psy3OPW8xosDYPlClmw5kFMe7c94GMqOtZQLn7/u
         sK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=BbftZSc1jV9GF+vfAP7o82YqYE5FqiN4Sx+D6VXJBOjLpgs9SdImav6uNX+eZC7x+O
         74kEa2lWpuXHncW8hr5b+vjOux0AZQmNs4iLUZrZhWut/onVygq4+dAUm3f7ZgBHuFVX
         CRab6Eu9uKX4nYKWz1bYCXNrqsbq1cKnN0xZGfGZQSRrfgxlunVfFV8A2++jBa9zoBbi
         WkmPGvqR6EcftknnMI6lv/5mgMkRUD+QzL5GLwRomDi/GAmHVwVbRtYddph2x5XlG2rs
         nKR6n5g0vXHH2LPMrY5STHNnkdAWbkNUZWFfH1RNSfC4Oz4ums0g+/+REZM6RcLxm/vt
         /6vw==
X-Gm-Message-State: AOAM533HPr/Y9n93o91zXMFMHQ6O+WMcQHyEVCR+d7fRpLuihy5AvCgv
        DKbeoYeNgzRampjWPcRj46NOd+8M5u6r4Pv7xUM=
X-Google-Smtp-Source: ABdhPJw1yOHIS1DBaSUO32iPWAtI1XCQiXUlHAHL+HhxrGkPlYlqBmoieKA1MzkoTEXTc4hxq9SuD2thnVK4Vor2v+A=
X-Received: by 2002:a17:906:c00a:: with SMTP id e10mr9355929ejz.501.1612623347778;
 Sat, 06 Feb 2021 06:55:47 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:55:47
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:55:47 +0100
Message-ID: <CAGSHw-Dz=vJYeWqus3OLgqT8w1Di_nTEu4GvjwRM1ysUtgU_Eg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
