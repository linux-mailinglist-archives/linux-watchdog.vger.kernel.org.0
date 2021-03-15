Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB78033AD1D
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 09:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhCOIMo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 04:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhCOIM1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 04:12:27 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D367C061574
        for <linux-watchdog@vger.kernel.org>; Mon, 15 Mar 2021 01:12:26 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j2so8157173wrx.9
        for <linux-watchdog@vger.kernel.org>; Mon, 15 Mar 2021 01:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=tlf8w447PnkWDa8Ig8yXLZ5c7078B/Fouco3NbjfaNQ=;
        b=tvyG7ysGsMFk0Z9QowxXIEBP9pRxzMhtKRfRwiTYikSB6ylgi62oFnv+OKW5PDenEk
         fBnToMlZ0gOtAjQpl/9WESYRebxM7VTbMZQ9U5/w32HXDooOYUtqqmZA+5loFrLPcgI7
         28XWK17f8wNNDJNlN5uxrIFF16X3CyEEZr+Ea0GQjCcGnd4waOshSWgk+B01JLGCusel
         ymKQpSTSRP/0ilJjJht2W9TJrFA6s/S2a5QnxAIbcrJUX9rKmGrr5HGwcK5qtqsodUeg
         q1ywcH0HNiwtlSX1iwln+F53J3SZpHy05Dxgw29qxdItoG97shBPpJIIKp+nyIcsfh5u
         R9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=tlf8w447PnkWDa8Ig8yXLZ5c7078B/Fouco3NbjfaNQ=;
        b=e+RTE1VSsQWAeeOvdOKSu7vfGgs8ebMrrmP4xnpkr3LZz+4rdDiHxH4wSMbGXJh29+
         01P6PUpL4y6KYr88RR0WeGKWmpMH8vq97gv9jIFhk/PRqlPPRBI7J7OiVIz6sYu3lQQ7
         ggXSvTkym+mVNB1Tg50tlqKh3TeTiK/lx8wQux41Zr8B6r26rHUfpYpluFngQwbxxFO4
         DgRvkWL6Ci1m4yPuSH1yWGNe4Hu+5wFQhZJBwHjDE88Zx0drcpULIgbKa6gl0mvC9FEV
         9XJE/ssvVsqOzwDfOqy5IbK1KcZaCqHLDidt74qGgnx7/ETxaAl/KaF/KQ+1ivEzem4A
         fpIw==
X-Gm-Message-State: AOAM5307CKhtEX58hMFA5M5Xow8WLAAlxJQn/HoZ+pHtcsFWmJvY2g0Z
        P/HvWKNKFjRXx2EVBHTD4bXV6CjgHK6qhN2O2h8=
X-Google-Smtp-Source: ABdhPJxp+ehFeSk1c4I+S4+Pcl8Y5PzK1SNnBCqBI9XlW/pQ/613tM+8sx+rg3ck5gmPxoF0Zi5/eEi7r4gZHcwcTFg=
X-Received: by 2002:a05:6000:1547:: with SMTP id 7mr26268233wry.301.1615795945368;
 Mon, 15 Mar 2021 01:12:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:f70a:0:0:0:0:0 with HTTP; Mon, 15 Mar 2021 01:12:25
 -0700 (PDT)
Reply-To: stephenbordeaux@yahoo.com
From:   Stephen Bordeaux <jessicawalkert77@gmail.com>
Date:   Mon, 15 Mar 2021 09:12:25 +0100
Message-ID: <CAJeHwUK5k49BEhh+4ecHQt-wS3j9wKsyFF9PHOAtb_qige8hKQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Ich habe mich aufgrund der mit dieser Frage verbundenen Dringlichkeit
entschlossen, Sie zu kontaktieren. Ich bin Stephen Bordeaux,
Rechtsanwalt. Ich pers=C3=B6nlich bin ein Treuhandagent von Dr. Edwin,
einem weithin bekannten unabh=C3=A4ngigen Auftragnehmer hier in Lome Togo,
der mit seiner Frau und seiner einzigen Tochter bei einem Autounfall
ums Leben kam. Ich habe Sie kontaktiert, um mich bei der R=C3=BCckf=C3=BChr=
ung
des Fondsverm=C3=B6gens zu unterst=C3=BCtzen. Acht Millionen f=C3=BCnfhunde=
rttausend
Dollar auf Ihr Konto. Bitte kontaktieren Sie mich f=C3=BCr weitere
Informationen zu diesem Thema.
